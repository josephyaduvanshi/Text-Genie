import 'dart:convert';
import 'dart:developer' as logs;
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:dart_style/dart_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';
import 'package:yaml/yaml.dart';

import '../widgets/custom_snackbar.dart';

class TextGenieUtils {
  static String getInitials(String name) {
    if (name.isEmpty) {
      return '';
    }
    final List<String> names = name.split(' ');
    if (names.length == 1) {
      return names[0].substring(0, 1).toUpperCase();
    }
    return names[0].substring(0, 1).toUpperCase() +
        names[1].substring(0, 1).toUpperCase();
  }

  static String getInitialsFromEmail(String email) {
    if (email.isEmpty) {
      return '';
    }
    final List<String> names = email.split('@');
    if (names.length == 1) {
      return names[0].substring(0, 1).toUpperCase();
    }
    return names[0].substring(0, 1).toUpperCase() +
        names[1].substring(0, 1).toUpperCase();
  }

  static Color fileStatusColor({required String status}) {
    final Map<String, Color> fileStatusColor = {
      'IDLE': Colors.grey,
      'Importing...': Colors.orange,
      'IMPORTED': Colors.green,
      'Import Error': Colors.red,
      'Processing...': Colors.orange,
      'PROCESSED': Colors.green,
      'Process Error': Colors.red,
      'Saving...': Colors.orange,
      'Save Error': Colors.red,
      'SAVED': Vx.green400,
    };
    return fileStatusColor[status] ?? Colors.grey;
  }

  static Future<void> saveFile({
    required String fileName,
    required String subName,
    required String fileContent,
  }) async {
    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Your File to desired location',
        fileName:
            '${fileName.split(".")[0]}_$subName${DateTime.now().millisecondsSinceEpoch}.txt');
    if (outputFile == null) {
      ShowSnackBar.snackError(
        title: 'File not saved',
        sub: 'Please select a location to save the file',
      );
      return;
    }
    try {
      File returnedFile = File(outputFile);
      await returnedFile.writeAsBytes(fileContent.codeUnits);
    } catch (e) {
      logs.log(e.toString());
    }
  }

  static String shortNumber(num n) {
    if (n < 1000) {
      return n.toString();
    }
    Map<int, String> prefixes = {3: 'k', 6: 'M', 9: 'B', 12: 'T'};
    for (int i in prefixes.keys) {
      if (n < pow(10, i + 3)) {
        return "${(n / pow(10, i)).toStringAsFixed(1)}${prefixes[i]}";
      }
    }
    return n.toString();
  }

  static String storageShort(int n) {
    if (n < 1024) {
      return '$n B';
    }
    Map<int, String> prefixes = {3: 'KB', 6: 'MB', 9: 'GB', 12: 'TB'};
    for (int i in prefixes.keys) {
      if (n < pow(1024, i + 1)) {
        return "${(n / pow(1024, i)).toStringAsFixed(1)}${prefixes[i]}";
      }
    }
    return n.toString();
  }

  static String jsPrettify(String jsCode) {
    final formatter = DartFormatter();
    try {
      final output = formatter.format(jsCode);
      return output;
    } catch (e) {
      return jsCode;
    }
  }

  static String xmlPrettify(String xmlCode) {
    final document = XmlDocument.parse(xmlCode);
    return document.toXmlString(pretty: true);
  }

  static String xmlMinify(String xmlCode) {
    XmlDocument document = XmlDocument.parse(xmlCode);
    return document.toXmlString(pretty: false, indent: '');
  }

  static String xmlToJson(
      {required String xml, XmlDecodingType type = XmlDecodingType.parker}) {
    final translateEngine = Xml2Json();
    translateEngine.parse(xml);
    String json = translateEngine.toGData();
    switch (type) {
      case XmlDecodingType.badger:
        json = translateEngine.toBadgerfish();
        break;
      case XmlDecodingType.gdata:
        json = translateEngine.toGData();
        break;
      case XmlDecodingType.parker:
        json = translateEngine.toParker();
        break;
      case XmlDecodingType.parkerWithAttributes:
        json = translateEngine.toParkerWithAttrs();
        break;
    }
    return json;
  }

  static String jsonToXml(Map jsonObject) {
    var builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('root', nest: () {
      _jsonObjectToXml(builder, jsonObject);
    });

    var xmlString = builder.buildDocument().toXmlString(pretty: true);

    return xmlString;
  }

  static void _jsonObjectToXml(XmlBuilder builder, Map jsonObject) {
    jsonObject.forEach((key, value) {
      if (value is Map) {
        builder.element(key, nest: () {
          _jsonObjectToXml(builder, value);
        });
      } else {
        builder.element(key, nest: value.toString());
      }
    });
  }

  static String xmlToCsv(String xmlString) {
    String json = xmlToJson(xml: xmlString);
    Map<String, dynamic> data = jsonDecode(json);
    List<List<dynamic>> rows = [];
    data.forEach((key, value) {
      rows.add([key, value]);
    });

    String csv = const ListToCsvConverter().convert(rows);

    return csv;
  }

  static String jsonToCsv(String jsonString) {
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<List<dynamic>> rows = [];
    data.forEach((key, value) {
      rows.add([key, value]);
    });
    String csv = const ListToCsvConverter().convert(rows);
    return csv;
  }

  static String csvToJson(String csvString) {
    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(csvString);
    Map<String, dynamic> data = {};
    for (var element in rowsAsListOfValues) {
      data[element[0]] = element[1];
    }
    String json = jsonEncode(data);
    return json;
  }

  static String csvToXml(String csvString) {
    String json = csvToJson(csvString);
    String xml = jsonToXml(jsonDecode(json));
    return xml;
  }

  static String csvToYaml(String csvString) {
    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(csvString);
    Map<String, dynamic> data = {};
    for (var element in rowsAsListOfValues) {
      data[element[0]] = element[1];
    }
    String yaml = jsonEncode(data);
    return yaml;
  }

  static String yamlToJson(String yamlString) {
    Map<String, dynamic> data = loadYaml(yamlString);
    String json = jsonEncode(data);
    return json;
  }

  static String yamlToXml(String yamlString) {
    String json = yamlToJson(yamlString);
    String xml = jsonToXml(jsonDecode(json));
    return xml;
  }

  static String yamlToCsv(String yamlString) {
    String json = yamlToJson(yamlString);
    String csv = jsonToCsv(json);
    return csv;
  }

  static String jsonToPlainText(dynamic jsonObject) {
    Map map = json.decode(jsonObject);
    var buffer = StringBuffer();
    _parseJsonMap(map, buffer);
    return buffer.toString();
  }

  static void _parseJsonMap(Map map, StringBuffer buffer, {int indent = 0}) {
    map.forEach((key, value) {
      if (value is Map) {
        buffer.write('\n${'  ' * indent}$key:');
        _parseJsonMap(value, buffer, indent: indent + 1);
      } else if (value is List) {
        buffer.write('\n${'  ' * indent}$key:');
        _parseJsonList(value, buffer, indent: indent + 1);
      } else {
        buffer.write('\n${'  ' * indent}$key: $value');
      }
    });
  }

  static void _parseJsonList(List list, StringBuffer buffer, {int indent = 0}) {
    for (var i = 0; i < list.length; i++) {
      var value = list[i];
      if (value is Map) {
        buffer.write('\n${'  ' * indent}-');
        _parseJsonMap(value, buffer, indent: indent + 1);
      } else if (value is List) {
        buffer.write('\n${'  ' * indent}-');
        _parseJsonList(value, buffer, indent: indent + 1);
      } else {
        buffer.write('\n${'  ' * indent}- $value');
      }
    }
  }

  Future<String?> getPublicIPAddress() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var address = result[0].rawAddress.join('.');
        return address;
      }
    } on SocketException catch (_) {
      return 'Failed to get public IP address';
    }
  }
}

enum XmlDecodingType { badger, gdata, parker, parkerWithAttributes }
