import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/themes/theme.dart';

class ThemeController extends GetxController {
  final _theme = TextGenieTheme.dark().obs;

  ThemeData get theme => _theme.value;
  set theme(ThemeData value) => _theme.value = value;

  void switchTheme() {
    theme = theme == TextGenieTheme.light()
        ? TextGenieTheme.dark()
        : TextGenieTheme.light();
  }
}
