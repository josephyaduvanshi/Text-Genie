import 'package:get/get.dart';

import '../controllers/global_file_import_export_controller.dart';
import '../controllers/sort_text_controller.dart';

class SortTextBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalFileController());
    Get.put(SortTextController());
  }
}
