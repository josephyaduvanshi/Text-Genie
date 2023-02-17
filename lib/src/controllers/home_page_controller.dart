import 'package:get/get.dart';
import 'package:textgenie/src/constants/homepage_constants.dart';
import 'package:textgenie/src/models/tools_specifiers_model.dart';

class HomePageController extends GetxController {
  final List<String> tabsName = HomePageConstants.tabsName;

  final List<ToolSpecifierModel> homePageItems =
      HomePageConstants.homePageItems;
}
