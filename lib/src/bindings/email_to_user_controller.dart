import 'package:get/get.dart';
import 'package:textgenie/src/controllers/global_file_import_export_controller.dart';

import '../controllers/email_to_user_controller.dart';

class EmailToUserPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailToUserController>(
      () => EmailToUserController(),
    );
    Get.lazyPut<GlobalFileController>(
      () => GlobalFileController(),
    );
  }
}
