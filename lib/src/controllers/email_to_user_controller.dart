import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:textgenie/src/utils/text_genie_utils.dart';
import 'package:textgenie/src/widgets/custom_snackbar.dart';

import '../database/adapters/email_to_user_history_model.dart';
import 'global_file_import_export_controller.dart';

class EmailToUserController extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> userController =
      TextEditingController(text: "Empty...").obs;
  final String _subName = 'email_to_user';
  final RxInt _selectedTab = 0.obs;

  int get selectedTab => _selectedTab.value;

  String get subName => _subName;

  Box<EmailToUserHistoryModel>? box;

  @override
  void onInit() async {
    super.onInit();
    if (!Hive.isAdapterRegistered(EmailToUserHistoryModelAdapter().typeId)) {
      Hive.registerAdapter<EmailToUserHistoryModel>(
          EmailToUserHistoryModelAdapter());
    } else {
      log("Adapter is already registered");
    }
    box = await Hive.openBox<EmailToUserHistoryModel>("email_to_user");
  }

  @override
  void onClose() async {
    emailController.value.dispose();
    userController.value.dispose();
    await box!.close();
    super.onClose();
  }

  void onChangeTab(int? index) {
    _selectedTab.value = index!;
    update();
  }

  void onChangedSwitch(bool value) {
    GlobalFileController.to.byFile = value;
    update();
  }

  Future<void> _addToHistoryDatabaseHive() async {
    await box!.add(EmailToUserHistoryModel(
      type: GlobalFileController.to.byFile
          ? "Email to User File"
          : "Email to User Text",
      fileName: GlobalFileController.to.fileName,
      fileSize: GlobalFileController.to.fileSize,
      fileContent: _returnMaxTenLines(GlobalFileController.to.fileContent),
      numberOfLines: GlobalFileController.to.fileLength,
      date: DateTime.now(),
    ));
  }

  String _returnMaxTenLines(String content) {
    final List<String> lines = content.split('\n');
    final List<String> maxTenLines = lines.take(10).toList();
    return maxTenLines.join('\n');
  }



  void setEmailControllerValue() {
    final fileContentController = GlobalFileController.to.fileContentController;
    if (fileContentController.text.isNotEmpty) {
      emailController.value.text = fileContentController.text;
    }
  }

  void convertEmailToUser() {
    if (GlobalFileController.to.byFile) {
      _convertEmailToUserFromFile();
    } else {
      _convertEmailToUserFromText();
    }
  }

  void _convertEmailToUserFromText() async {
    GlobalFileController.to.fileStatus = 'Processing...';
    update();
    final lines = emailController.value.text.split('\n');
    final result = <String>[];
    for (final line in lines) {
      final split = line.split(RegExp(r'[@:]'));
      if (split.length == 3) {
        final username = split[0].trim();
        final password = split[2].trim();
        final user = '$username:$password';
        result.add(user);
      }
    }
    userController.value.text = result.join('\n');
    GlobalFileController.to.fileLength = TextGenieUtils.shortNumber(
        userController.value.text.split('\n').length);
    GlobalFileController.to.fileStatus = 'PROCESSED';
    await _addToHistoryDatabaseHive();
    update();
    ShowSnackBar.snackSuccess(
      title: 'Email to User Converted',
      sub: 'Email to User Converted successfully',
      position: SnackPosition.TOP,
    );
  }

  void _convertEmailToUserFromFile() async {
    GlobalFileController.to.fileStatus = 'Processing...';
    update();
    final lines = GlobalFileController.to.fileContent.split('\n');
    final result = <String>[];
    for (final line in lines) {
      final split = line.split(RegExp(r'[@:]'));
      if (split.length == 3) {
        final username = split[0].trim();
        final password = split[2].trim();
        final user = '$username:$password';
        result.add(user);
      }
    }
    userController.value.text = result.join('\n');
    GlobalFileController.to.fileContent = result.join('\n');
    GlobalFileController.to.fileLength = TextGenieUtils.shortNumber(
        GlobalFileController.to.fileContent.split('\n').length);
    GlobalFileController.to.fileStatus = 'PROCESSED';
    await _addToHistoryDatabaseHive();
    update();
    ShowSnackBar.snackSuccess(
      title: 'Email to User Converted',
      sub: 'Email to User Converted successfully',
      position: SnackPosition.TOP,
    );
  }

  void clear() {
    GlobalFileController.to.fileStatus = 'IDLE';
    GlobalFileController.to.fileContent = '';
    GlobalFileController.to.fileLength = '0';
    GlobalFileController.to.fileName = '';
    GlobalFileController.to.fileSize = '0';
    emailController.value.text = '';
    userController.value.text = '';
    update();
  }
}
