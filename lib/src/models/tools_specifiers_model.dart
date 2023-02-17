import 'package:flutter/material.dart';

class ToolSpecifierModel {
  final String name;
  final IconData? icon;
  final String imageAsset;
  final bool isAvailable;
  final VoidCallback onTap;
  final ToolSpecifierType type;

  final bool isBeta;

  const ToolSpecifierModel({
    required this.name,
    required this.onTap,
    required this.type,
    required this.isAvailable,
    required this.imageAsset,
    this.icon,
    required this.isBeta,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToolSpecifierModel &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

enum ToolSpecifierType {
  textManipulation,
  textFormat,
  textCleaners,
  unicode,
  scraping,
  basicTools,
  hashTools,
  comboTools,
  encoderDecoder,
  escaperUnescaper,
  validators,
  textConverters,
  passwordGenerators,
  calculators,
  randomGenerators,
  imageTools,
  qrCodeTools,
  colorTools,
  dateAndTime,
  beta,
  jsonXmlHtml,
  extra,
}
