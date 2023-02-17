import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/utils/text_genie_utils.dart';
import 'package:textgenie/src/widgets/custom_snackbar.dart';

class DuplicateRemoverController extends GetxController {
  final RxString _fileContent = ''.obs;
  final _filePickerInstance = FilePicker.platform;
  final RxString _fileName = ''.obs;
  final RxString _fileSize = ''.obs;
  final RxString _fileLength = '0'.obs;
  final String _subName = 'duplicate_removed';
  final RxString _fileStatus = 'IDLE'.obs;

  final _fileContentController = TextEditingController(text: "Empty..").obs;

  TextEditingController get fileContentController =>
      _fileContentController.value;

  String get fileStatus => _fileStatus.value;
  String get fileSize => _fileSize.value;
  String get fileLength => _fileLength.value;

  String get fileName => _fileName.value;
  Future<void> importFile() async {
    _fileStatus.value = 'Importing...';
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
      _fileStatus.value = 'Import Error';
      ShowSnackBar.snackError(
        title: 'No file selected',
        sub: 'Please select a file to continue',
        position: SnackPosition.TOP,
      );
      log('No file selected');
    }
  }

  void removeDuplicates() {
    _fileStatus.value = 'Processing...';
    update();
    final lines = _fileContent.split('\n');
    final uniqueLines = Set<String>.from(lines);
    final result = uniqueLines.join('\n');
    log(result);
    _fileContent.value = result;
    _fileLength.value =
        TextGenieUtils.shortNumber(_fileContent.value.split('\n').length);
    _fileStatus.value = 'PROCESSED';
    update();
    ShowSnackBar.snackSuccess(
      title: 'Duplicates removed',
      sub: 'Duplicates removed successfully',
      position: SnackPosition.TOP,
    );
  }

  Future<void> saveFile() async {
    _fileStatus.value = 'Saving...';
    update();
    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Your File to desired location',
        fileName:
            '${fileName.split(".")[0]}_$_subName${DateTime.now().millisecondsSinceEpoch}.txt');
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

  void clear() {
    _fileContent.value = '';
    _fileContentController.value.text = '';
    _fileSize.value = '';
    _fileLength.value = '0';
    _fileName.value = '';
    update();
  }
}
