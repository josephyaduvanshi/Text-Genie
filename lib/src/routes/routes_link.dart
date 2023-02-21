import 'package:get/get.dart';
import 'package:textgenie/src/pages/duplicate_cleaner_page.dart';
import 'package:textgenie/src/pages/email_to_user/email_to_user_page.dart';
import 'package:textgenie/src/pages/sort_text/sort_text_page.dart';
import 'package:textgenie/src/routes/route_names.dart';

import '../bindings/email_to_user_controller.dart';
import '../bindings/sort_text_page_binding.dart';
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
    GetPage(
      name: RouteNames.emailToUserPage,
      transition: Transition.zoom,
      page: () => const EmailToUserPage(),
      binding: EmailToUserPageBindings(),
    ),
    GetPage(
      name: RouteNames.sortTextPage,
      transition: Transition.zoom,
      page: () => const SortTextPage(),
      binding: SortTextBindings(),
    ),
  ];
}
