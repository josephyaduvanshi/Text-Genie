import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/utils/text_genie_utils.dart';

import '../widgets/custom_snackbar.dart';

class GlobalFileController extends GetxController {
  static GlobalFileController get to => Get.find();

  final _filePickerInstance = FilePicker.platform;
  final RxString _fileName = ''.obs;
  final RxString _fileSize = ''.obs;
  final RxString _fileContent = ''.obs;
  final RxString _fileLength = '0'.obs;
  final RxString _fileStatus = 'IDLE'.obs;
  final RxBool _byFile = false.obs;
  final _fileContentController = TextEditingController().obs;

  TextEditingController get fileContentController =>
      _fileContentController.value;

  String get fileStatus => _fileStatus.value;
  String get fileSize => _fileSize.value;
  String get fileLength => _fileLength.value;
  String get fileContent => _fileContent.value;
  bool get byFile => _byFile.value;
  String get fileName => _fileName.value;

  set fileSize(String size) {
    _fileSize.value = size;
    update();
  }

  set fileName(String name) {
    _fileName.value = name;
    update();
  }

  set byFile(bool value) {
    _byFile.value = value;
    update();
  }

  set fileStatus(String status) {
    _fileStatus.value = status;
    update();
  }

  set fileLength(String length) {
    _fileLength.value = length;
    update();
  }

  set fileContent(String content) {
    _fileContent.value = content;
    update();
  }

  Future<void> importFile() async {
    _fileStatus.value = 'Importing...';
    _byFile.value = true;
    update();
    final file = await _filePickerInstance.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['txt'],
    );
    if (file != null) {
      final path = file.files.single.path;
      _fileName.value = file.files.single.name;
      _fileContent.value = File(path!).readAsStringSync();
      _fileContentController.value.text = _fileContent.value;
      _fileSize.value = TextGenieUtils.storageShort(file.files.single.size);
      _fileLength.value =
          TextGenieUtils.shortNumber(_fileContent.value.split('\n').length);
      _fileStatus.value = 'IMPORTED';
      update();
      ShowSnackBar.snackSuccess(
        title: 'File imported',
        sub: 'File imported successfully',
        position: SnackPosition.TOP,
      );
    } else {
      _byFile.value = false;
      _fileStatus.value = 'Import Error';
      update();
      ShowSnackBar.snackError(
        title: 'No file selected',
        sub: 'Please select a file to continue',
        position: SnackPosition.TOP,
      );
      log('No file selected');
    }
  }

  Future<void> saveFile({required String subName}) async {
    _fileStatus.value = 'Saving...';
    update();
    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Your File to desired location',
        fileName:
            '${fileName.split(".")[0]}_$subName${DateTime.now().millisecondsSinceEpoch}.txt');
    if (outputFile == null) {
      _fileStatus.value = 'Save Error';
      update();
      ShowSnackBar.snackError(
        title: 'File not saved',
        sub: 'Please select a location to save the file',
      );
      return;
    }
    try {
      File returnedFile = File(outputFile);
      await returnedFile.writeAsBytes(_fileContent.value.codeUnits);
      _fileStatus.value = 'SAVED';
      update();
      ShowSnackBar.snackSuccess(
        title: 'File saved',
        sub: 'File saved successfully',
        position: SnackPosition.TOP,
      );
    } catch (e) {
      _fileStatus.value = 'Save Error';
      update();
      ShowSnackBar.snackError(title: 'File not saved', sub: e.toString());
      log(e.toString());
    }
  }

  @override
  void onClose() {
    _fileContentController.value.dispose();
    super.onClose();
  }
}
