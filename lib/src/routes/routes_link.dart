import 'package:get/get.dart';
import 'package:textgenie/src/pages/duplicate_cleaner_page.dart';
import 'package:textgenie/src/routes/route_names.dart';

import '../pages/homepage.dart';

class RoutesLink {
  static List<GetPage<dynamic>>? routes = [
    GetPage(
      name: RouteNames.homePage,
      transition: Transition.fadeIn,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.duplicateRemoverPage,
      transition: Transition.fadeIn,
      page: () => const DuplicateRemoverPage(),
    ),
  ];
}
