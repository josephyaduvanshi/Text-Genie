import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global_file_import_export_controller.dart';

class SortTextController extends GetxController {
  final Rx<TextEditingController> textController = TextEditingController().obs;
  final Rx<TextEditingController> sortedTextController =
      TextEditingController(text: "Empty...").obs;
  final Rx<TextEditingController> regexTextController =
      TextEditingController().obs;
  final RxInt _selectedTab = 0.obs;
  final String _subName = "sort_text";

  int get selectedTab => _selectedTab.value;
  String get subName => _subName;

  final RxInt _selectedRadio = 0.obs;
  int get selectedRadio => _selectedRadio.value;

  void setTextControllerValue() {
    final fileContentController = GlobalFileController.to.fileContentController;
    if (fileContentController.text.isNotEmpty) {
      textController.value.text = fileContentController.text;
    }
  }

  bool radioTranslationToBool(final int value) {
    final Map<int, bool> radioMap = {
      0: true,
      1: false,
      2: false,
    };
    return radioMap[value] ?? false;
  }

  void onSelectedRadio(int? value) {
    _selectedRadio.value = value!;
    GlobalFileController.to.byFile = radioTranslationToBool(value);
    update();
  }

  @override
  void onClose() {
    textController.value.dispose();
    sortedTextController.value.dispose();
    regexTextController.value.dispose();
    super.onClose();
  }

  void onChangeTab(int? index) {
    _selectedTab.value = index!;
  }

  void onChangedSwitch(bool value) {
    GlobalFileController.to.byFile = value;
    update();
  }

  void importFile() async {
    await GlobalFileController.to.importFile();
  }

  void exportFile() async {
    await GlobalFileController.to.saveFile(subName: _subName);
  }

  void sortTextLines({String? regex}) {
    final text = textController.value.text;
    final lines = text.split('\n');
    final sortedLines = lines..sort();
    final sortedText = sortedLines.join('\n');
    sortedTextController.value.text = sortedText;
    update();
  }

  void clearText() {
    GlobalFileController.to.fileStatus = 'IDLE';
    GlobalFileController.to.fileContent = '';
    GlobalFileController.to.fileLength = '0';
    GlobalFileController.to.fileName = '';
    GlobalFileController.to.fileSize = '0';
    textController.value.clear();
    sortedTextController.value.clear();
    regexTextController.value.clear();
    update();
  }
}
