import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/utils/helper_functions.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/global_file_import_export_controller.dart';
import '../utils/text_genie_utils.dart';
import 'custom_button_with_icon.dart';

class CustomFileControlsWidget extends StatelessWidget {
  final controller;
  final void Function()? setControllerValue;
  final GlobalFileController globalFileController;
  final Widget switchRadioWidget;
  const CustomFileControlsWidget({
    Key? key,
    required this.setControllerValue,
    required this.controller,
    required this.globalFileController,
    required this.switchRadioWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "Status: "
                      .richText
                      .align(TextAlign.start)
                      .bold
                      .withTextSpanChildren([
                    ' ${globalFileController.fileStatus}'
                        .textSpan
                        .bold
                        .color(
                          TextGenieUtils.fileStatusColor(
                            status: globalFileController.fileStatus,
                          ),
                        )
                        .make(),
                  ]).make(),
                  8.heightBox,
                  "Number of Lines: ${globalFileController.fileLength}"
                      .text
                      .align(TextAlign.start)
                      .semiBold
                      .make(),
                  8.heightBox,
                  globalFileController.byFile
                      ? "File Name: ${globalFileController.fileName}"
                          .text
                          .align(TextAlign.start)
                          .semiBold
                          .overflow(TextOverflow.ellipsis)
                          .make()
                      : 0.heightBox,
                  8.heightBox,
                  globalFileController.byFile
                      ? "File Size: ${globalFileController.fileSize}"
                          .text
                          .align(TextAlign.start)
                          .semiBold
                          .make()
                      : 0.heightBox,
                ],
              ).px(18),
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: const Color.fromARGB(255, 195, 130, 180),
          ),
          Flexible(
            child: Column(
              children: [
                CustomButtonWithIcon(
                  alignLeft: true,
                  isImage: false,
                  backgroundColor: Vx.green600,
                  hightLightColor: Colors.blue,
                  splashColor: Colors.red,
                  textScale: 1.1,
                  height: 34,
                  width: 200,
                  iconData: Icons.file_upload,
                  title: 'Import File',
                  onTap: () async {
                    await globalFileController.importFile();
                    setControllerValue!();
                  },
                ).disabled(HelperFunctions.checkFileStatus(
                        globalFileController.fileStatus) ||
                    !globalFileController.byFile),
                15.heightBox,
                CustomButtonWithIcon(
                  alignLeft: true,
                  isImage: false,
                  textScale: 1.1,
                  backgroundColor: Vx.blue600,
                  hightLightColor: Colors.red,
                  splashColor: Vx.green600,
                  height: 34,
                  width: 200,
                  iconData: Icons.file_download,
                  title: 'Export File',
                  onTap: () {
                    globalFileController.saveFile(subName: controller.subName);
                  },
                ).disabled(HelperFunctions.checkSaveStatus(
                    globalFileController.fileStatus)),
              ],
            ),
          ),
          Flexible(
            child: Container(
              width: 1,
              height: 120,
              color: const Color.fromARGB(255, 195, 130, 180),
            ),
          ),
          Flexible(child: switchRadioWidget)
        ],
      );
    });
  }
}
