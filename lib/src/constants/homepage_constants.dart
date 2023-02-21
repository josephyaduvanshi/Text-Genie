import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/gen/assets.gen.dart';
import 'package:textgenie/src/models/tools_specifiers_model.dart';
import 'package:textgenie/src/pages/menu/custom_menu_page.dart';
import 'package:textgenie/src/routes/route_names.dart';

class HomePageConstants {
  static final List<String> tabsName = [
    "All Tools",
    "Basic Tools",
    "Combo Tools",
    "Text Manipulation",
    "Text Format",
    "Text Cleaners",
    "Unicode Tools",
    "Scraping Web/Local",
    "Hash Tools",
    "JSON/XML/HTML Tools",
    "Encoder/Decoder",
    "Escaper/Unescaper",
    "Validators",
    "Password Generators",
    "Calculators",
    "Random Generators",
    "Image Tools",
    "QR Code Tools",
    "Color Tools",
    "Date and Time",
    "Beta",
    "Extra",
  ];

  static final List<ToolSpecifierModel> homePageItems = [
    ToolSpecifierModel(
      name: "Email To User",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.emailToUser.path,
      isAvailable: true,
      isBeta: false,
      onTap: () async {
        await Get.toNamed(RouteNames.emailToUserPage);
      },
    ),
    ToolSpecifierModel(
      name: "Combo Extractor",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.extract.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Duplicate Remover",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.duplicateRemover.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Duplicate Remover",
      type: ToolSpecifierType.textCleaners,
      imageAsset: Assets.images.duplicateRemover.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Add Domain(User to Email)",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.addDomain.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Combo Combiner",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.comboCombiner.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Combo Reverser",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.reverser.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Email Sorter",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.sort.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Combo Splitter",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.splitter.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Combo Randomiser",
      type: ToolSpecifierType.comboTools,
      imageAsset: Assets.images.randomizer.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Sort Text",
      type: ToolSpecifierType.basicTools,
      imageAsset: Assets.images.sort.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {
        Get.toNamed(RouteNames.sortTextPage);
      },
    ),
    ToolSpecifierModel(
      name: "Sort Text",
      type: ToolSpecifierType.textCleaners,
      imageAsset: Assets.images.sort.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Convert Case",
      type: ToolSpecifierType.basicTools,
      imageAsset: Assets.images.convertCase.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Convert Case",
      type: ToolSpecifierType.textFormat,
      imageAsset: Assets.images.convertCase.path,
      isAvailable: true,
      isBeta: false,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Find and Replace",
      type: ToolSpecifierType.basicTools,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.findReplace.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Find and Replace",
      type: ToolSpecifierType.textManipulation,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.findReplace.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
        name: "Reverse List/Text",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.reverse.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Reverse List/Text",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.reverse.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Compare Text",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.compare.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Word Counter",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.wordCount.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Character Counter",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.letterCount.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Line Counter",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textTool1.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Remove Empty Lines",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.removeEmpty.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Remove Empty Lines",
        type: ToolSpecifierType.textCleaners,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.removeEmpty.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "JSON to XML/CSV/YAML/TEXT",
        type: ToolSpecifierType.jsonXmlHtml,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.json.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "XML to JSON/CSV/YAML/TEXT",
        type: ToolSpecifierType.jsonXmlHtml,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.xml.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "CSV to JSON/XML/YAML/TEXT",
        type: ToolSpecifierType.jsonXmlHtml,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.csv.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "URL Encode/Decode",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.url.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "HTML Encode/Decode",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.html.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Base64 Encode/Decode",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.base64.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Base58 Encode/Decode",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.base58.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Base32 Encode/Decode",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.base32.path,
        onTap: () {}),
    ToolSpecifierModel(
      name: "JSON Prettify/Minify",
      type: ToolSpecifierType.jsonXmlHtml,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.jsonPrettify.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "JSON Escape/Unescape",
      type: ToolSpecifierType.escaperUnescaper,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.jsonEscapeUnescape.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "JSON Validator",
      type: ToolSpecifierType.validators,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.jsonValidator.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "XML Validator",
      type: ToolSpecifierType.validators,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.xml.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "XML Prettify/Minify",
      type: ToolSpecifierType.jsonXmlHtml,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.xmlPrettify.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
        name: "JPEG to PNG/WEBP/JPG",
        type: ToolSpecifierType.imageTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.jpegToPng.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "PNG to JPEG/WEBP/JPG",
        type: ToolSpecifierType.imageTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.pngTo.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "WEBP to PNG/JPEG/JPG",
        type: ToolSpecifierType.imageTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.webpTo.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "JPG to WEBP/PNG/JPEG",
        type: ToolSpecifierType.imageTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.jpgTo.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "HEIC to JPEG/PNG/WEBP/JPG",
        type: ToolSpecifierType.imageTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.heicTo.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Time Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.time.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Date Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.date.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Number Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc1.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random String Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc2.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Color Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.randomColor.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Password Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.password.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random UUID/GUID Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.uuid.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random MAC Address Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.macAddy.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random IBAN Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.iban.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Credit Card Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.creditCard.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Crypto Address Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.cryptoAddy.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Prime Number Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.primeNumber.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Fibonacci Number Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.fibonacci.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Pi Digit Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.pi.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "E Digit Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.eNumber.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Decimal to Scientific Notation Converter",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.decimal.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Scientific to Decimal",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.scientific.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Add Line Numbers",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.addLine.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Add Line Prefixes/Suffixes",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.prefixSuffix.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Find Longest/Shortest Text Line",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.longShort.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Empty Line Remover",
        type: ToolSpecifierType.textCleaners,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.removeEmpty.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Randomizer",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.randomizer.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Letter Randomizer",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.letterRaqndomize.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Line Joiner",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textJoin.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "String Splitter",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.splitter.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Line Reverser",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.reverse2.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Line Filter",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textFilter.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Paragraph Counter",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.paragraph.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Paragraph Counter",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.paragraph.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Letter Frequency Calc",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.letterFrequency.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Letter Frequency Calc",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.letterFrequency.path,
        onTap: () {}),
    ToolSpecifierModel(
      name: "Word Frequency Calc",
      type: ToolSpecifierType.basicTools,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.wordFrequency.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Word Frequency Calc",
      type: ToolSpecifierType.calculators,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.wordFrequency.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
        name: "Phrase Frequency Calculator",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.phraseFrequency.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Phrase Frequency Calculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.phraseFrequency.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Statistics",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textStat.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Statistics",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textStat.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random Element Picker",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc3.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random JSON Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.jsonGen.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random XML Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.xmlGen.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random CSV Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.csvGen.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random TSV Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.tsv.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Random YAML Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.yaml.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Email Extractor",
        type: ToolSpecifierType.scraping,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.emailExtract.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "URL Extractor",
        type: ToolSpecifierType.scraping,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.url.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Phone Number Extractor",
        type: ToolSpecifierType.scraping,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc4.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "IP Address Extractor",
        type: ToolSpecifierType.scraping,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.ipExtract.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "HTML Tag Extractor",
        type: ToolSpecifierType.scraping,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.htmlTag.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "HTML Attribute Extractor",
        type: ToolSpecifierType.scraping,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.htmlAttributes.path,
        onTap: () {}),
    ToolSpecifierModel(
      name: "Text Intersection",
      type: ToolSpecifierType.basicTools,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.intersection.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
      name: "Text Intersection",
      type: ToolSpecifierType.calculators,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.intersection.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
        name: "Text Difference",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textDifference.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Union",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.union.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Difference",
        type: ToolSpecifierType.basicTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textDifference.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Union",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.union.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Printf Formatter",
        type: ToolSpecifierType.textFormat,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.printf.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Grep",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textGrep.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Head",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.findReplace.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Tail",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textTail.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Word Wrapper",
        type: ToolSpecifierType.textFormat,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.wordWrapper.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text From Regex Generator",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.regex.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Center Text",
        type: ToolSpecifierType.textFormat,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textCenter.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Left/Right Justify Text",
        type: ToolSpecifierType.textFormat,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.justifyText.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text to Decimal/Hex/Binary/Octal",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc5.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Truncate Text Lines",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.truncate.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Trim Text Lines",
        type: ToolSpecifierType.textFormat,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textTrim.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Spaces to Tabs/Newlines",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.spacesToTab.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Tabs to Spaces",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.tabText.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Newlines to Spaces",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc6.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Character Accent Remover",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc7.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Whitespaces Remover",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.remover1.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Punctuation Mark Remover",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.punctuation.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Thousands Separator Adder",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.thousands.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Backslash Remover/Adder",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.misc8.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Transformer",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.transformer.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Repeater",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.repeater.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Text Rotate",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.textRotate.path,
        onTap: () {}),
    ToolSpecifierModel(
      name: "HTML Tools",
      type: ToolSpecifierType.encoderDecoder,
      isAvailable: true,
      isBeta: false,
      imageAsset: Assets.images.htmlTools.path,
      onTap: () {},
    ),
    ToolSpecifierModel(
        name: "IP to Binary/Decimal/Octal",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.ip.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "IP Address Sorter",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sort.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "ROT13 encoder/decoder",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.encode.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Morse Code Encoder/Decoder",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.morseCode.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "XOR encryption/decryption",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.xor.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "AES encryption/decryption",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.aes.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "RC4 encryption/decryption",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.rc4.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "DES encryption/decryption",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.des.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Rabbit Encryptor/Decryptor",
        type: ToolSpecifierType.encoderDecoder,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.rabbit.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "MD5HashCalculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.md5.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "SHA1HashCalculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sha1.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "SHA256HashCalculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sha256.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "SHA512HashCalculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sha512.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "NTLM Hash Calculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.ntlm.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "RipeMD128 Hash Calculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.ripeMD128.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "CRC16 Hash Calculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.crc16.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "HMAC Hash Calculator",
        type: ToolSpecifierType.calculators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.hmac.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "MD5HashCalculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.md5.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "SHA1HashCalculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sha1.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "SHA256HashCalculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sha256.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "SHA512HashCalculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.sha512.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "NTLM Hash Calculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.ntlm.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "RipeMD128 Hash Calculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.ripeMD128.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "CRC16 Hash Calculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.crc16.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "HMAC Hash Calculator",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.hmac.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Zalgo Text Gen",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.zalgo.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Slugify Text",
        type: ToolSpecifierType.textManipulation,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.slugify.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Hash Identifier",
        type: ToolSpecifierType.hashTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.hash.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "Lorem ipsum Generator",
        type: ToolSpecifierType.randomGenerators,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.loremipsum.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "QR Code Generator",
        type: ToolSpecifierType.qrCodeTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.qr.path,
        onTap: () {}),
    ToolSpecifierModel(
        name: "QR Code Scanner",
        type: ToolSpecifierType.qrCodeTools,
        isAvailable: true,
        isBeta: false,
        imageAsset: Assets.images.qrscan.path,
        onTap: () {}),
  ];

  static final List<Widget> homePageWidgets =
      List.generate(tabsName.length, (index) {
    final Map<int, Widget> widgets = {
      0: CustomMenuPage(
        itemCount: homePageItems.toSet().toList().length,
        homePageItems: homePageItems.toSet().toList(),
      ),
      1: CustomMenuPage(
        itemCount: homePageItems
            .where(
              (element) => element.type == ToolSpecifierType.basicTools,
            )
            .length,
        homePageItems: homePageItems
            .where((element) => element.type == ToolSpecifierType.basicTools)
            .toList(),
      ),
      2: CustomMenuPage(
        itemCount: homePageItems
            .where(
              (element) => element.type == ToolSpecifierType.comboTools,
            )
            .length,
        homePageItems: homePageItems
            .where(
              (element) => element.type == ToolSpecifierType.comboTools,
            )
            .toList(),
      ),
      3: CustomMenuPage(
        itemCount: homePageItems
            .where(
              (element) => element.type == ToolSpecifierType.textManipulation,
            )
            .length,
        homePageItems: homePageItems
            .where(
              (element) => element.type == ToolSpecifierType.textManipulation,
            )
            .toList(),
      ),
      4: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.textFormat,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.textFormat,
              )
              .toList()),
      5: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.textCleaners,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.textCleaners,
              )
              .toList()),
      6: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.unicode,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.unicode,
              )
              .toList()),
      7: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.scraping,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.scraping,
              )
              .toList()),
      8: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.hashTools,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.hashTools,
              )
              .toList()),
      9: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.jsonXmlHtml,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.jsonXmlHtml,
              )
              .toList()),
      10: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.encoderDecoder,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.encoderDecoder,
              )
              .toList()),
      11: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.escaperUnescaper,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.escaperUnescaper,
              )
              .toList()),
      12: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.validators,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.validators,
              )
              .toList()),
      13: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) =>
                    element.type == ToolSpecifierType.passwordGenerators,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) =>
                    element.type == ToolSpecifierType.passwordGenerators,
              )
              .toList()),
      14: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.calculators,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.calculators,
              )
              .toList()),
      15: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.randomGenerators,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.randomGenerators,
              )
              .toList()),
      16: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.imageTools,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.imageTools,
              )
              .toList()),
      17: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.qrCodeTools,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.qrCodeTools,
              )
              .toList()),
      18: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.colorTools,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.colorTools,
              )
              .toList()),
      19: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.dateAndTime,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.dateAndTime,
              )
              .toList()),
      20: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.beta,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.beta,
              )
              .toList()),
      21: CustomMenuPage(
          itemCount: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.extra,
              )
              .length,
          homePageItems: homePageItems
              .where(
                (element) => element.type == ToolSpecifierType.extra,
              )
              .toList()),
    };
    return widgets[index]!;
  });
}
