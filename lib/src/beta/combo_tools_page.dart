import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/beta/beta_combo_tools_page_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custom_sidebar.dart';
import 'macos_sidebar_widget.dart';

class ComboToolsPageBeta extends GetView<ComboToolsPageBetaController> {
  const ComboToolsPageBeta({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ComboToolsPageBetaController());
    return GetX(
      init: controller,
      builder: (controller) => SidebarFrame(
        macOSBlurViewState: MacOSBlurViewState.active,
        sidebar: const SideBarWidget().pOnly(top: 40),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: controller.items[controller.selectedIndex.value].widget_,
        ),
      ),
    );
  }
}
