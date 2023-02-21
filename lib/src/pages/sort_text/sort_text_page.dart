import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/controllers/global_file_import_export_controller.dart';
import 'package:textgenie/src/controllers/sort_text_controller.dart';
import 'package:textgenie/src/widgets/custom_button_with_icon.dart';
import 'package:textgenie/src/widgets/custom_file_controls.dart';
import 'package:textgenie/src/widgets/custom_radio_list_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/text_genie_utils.dart';

class SortTextPage extends GetView<SortTextController> {
  const SortTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort Text'),
        elevation: 3,
      ),
      body: Column(
        children: [
          12.heightBox,
          Row(
            children: [
              "Combo".text.center.bold.xl.make().px(30).expand(flex: 1),
              "Converted".text.center.bold.xl.make().px(30).expand(flex: 1),
            ],
          ),
          12.heightBox,
          Row(
            children: [
              Obx(() {
                return Flexible(
                  child: TextField(
                    controller: controller.textController.value,
                    readOnly: GlobalFileController.to.byFile,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: !GlobalFileController.to.byFile
                          ? "Enter Text"
                          : "Import File",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
              40.widthBox,
              Flexible(
                child: Stack(
                  children: [
                    TextField(
                      controller: controller.sortedTextController.value,
                      readOnly: true,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () async {
                          await TextGenieUtils.copyToClipBoard(
                              controller.sortedTextController.value.text);
                        },
                        icon: const Icon(Icons.copy),
                      ).px(8).shimmer(
                            duration: 4.seconds,
                            primaryColor: Colors.purple,
                            secondaryColor: Colors.blue,
                          ),
                    ).py(8),
                  ],
                ),
              ),
            ],
          ).px(8),
          12.heightBox,
          const Divider().px(18).shimmer(
                duration: 4.seconds,
                primaryColor: Colors.purple,
                secondaryColor: Colors.blue,
              ),
          12.heightBox,
          CustomFileControlsWidget(
            globalFileController: GlobalFileController.to,
            controller: controller,
            setControllerValue: controller.setTextControllerValue,
            switchRadioWidget: Obx(() {
              return CustomRadioListWidget(
                groupValue: controller.selectedRadio,
                onChanged: controller.onSelectedRadio,
              ).px(18);
            }),
          ),
          12.heightBox,
          const Divider().px(18).shimmer(
                duration: 4.seconds,
                primaryColor: Colors.purple,
                secondaryColor: Colors.blue,
              ),
          18.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButtonWithIcon(
                  alignLeft: true,
                  isImage: false,
                  textScale: 1.1,
                  backgroundColor: Vx.blue500,
                  hightLightColor: Colors.green,
                  splashColor: Vx.green600,
                  height: 34,
                  width: 200,
                  iconData: Icons.autorenew_rounded,
                  title: 'Convert',
                  onTap: () => controller.sortTextLines(regex: null),
                ),
              ),
              30.widthBox,
              Expanded(
                child: CustomButtonWithIcon(
                  alignLeft: true,
                  isImage: false,
                  textScale: 1.1,
                  backgroundColor: Vx.red500,
                  hightLightColor: Colors.blue,
                  splashColor: Vx.green600,
                  height: 34,
                  width: 200,
                  iconData: Icons.clear,
                  title: 'Clear',
                  onTap: controller.clearText,
                ),
              ),
            ],
          ).px(18),
        ],
      ),
    );
  }
}
