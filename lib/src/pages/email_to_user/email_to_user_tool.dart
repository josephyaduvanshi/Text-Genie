import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/utils/helper_functions.dart';
import 'package:textgenie/src/utils/text_genie_utils.dart';
import 'package:textgenie/src/widgets/custom_button_with_icon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/email_to_user_controller.dart';
import '../../controllers/global_file_import_export_controller.dart';

class EmailToUserToolWidget extends StatelessWidget {
  final EmailToUserController controller;
  const EmailToUserToolWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  controller: controller.emailController.value,
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
                    controller: controller.userController.value,
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
                            controller.userController.value.text);
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
        Obx(() {
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
                        ' ${GlobalFileController.to.fileStatus}'
                            .textSpan
                            .bold
                            .color(
                              TextGenieUtils.fileStatusColor(
                                status: GlobalFileController.to.fileStatus,
                              ),
                            )
                            .make(),
                      ]).make(),
                      8.heightBox,
                      "Number of Lines: ${GlobalFileController.to.fileLength}"
                          .text
                          .align(TextAlign.start)
                          .semiBold
                          .make(),
                      8.heightBox,
                      GlobalFileController.to.byFile
                          ? "File Name: ${GlobalFileController.to.fileName}"
                              .text
                              .align(TextAlign.start)
                              .semiBold
                              .overflow(TextOverflow.ellipsis)
                              .make()
                          : 0.heightBox,
                      8.heightBox,
                      GlobalFileController.to.byFile
                          ? "File Size: ${GlobalFileController.to.fileSize}"
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
                height: 100,
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
                        await GlobalFileController.to.importFile();
                        controller.setEmailControllerValue();
                      },
                    ).disabled(HelperFunctions.checkFileStatus(
                            GlobalFileController.to.fileStatus) ||
                        !GlobalFileController.to.byFile),
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
                        GlobalFileController.to
                            .saveFile(subName: controller.subName);
                      },
                    ).disabled(HelperFunctions.checkSaveStatus(
                        GlobalFileController.to.fileStatus)),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 100,
                color: const Color.fromARGB(255, 195, 130, 180),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 195, 130, 180),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: (!GlobalFileController.to.byFile
                                ? "Convert By File"
                                : "Convert By Text")
                            .text
                            .semiBold
                            .make(),
                      ),
                      8.widthBox,
                      Container(
                          height: 50,
                          width: 1,
                          color: const Color.fromARGB(255, 195, 130, 180)),
                      8.widthBox,
                      Expanded(
                        child: Switch(
                          value: GlobalFileController.to.byFile,
                          onChanged: controller.onChangedSwitch,
                        ),
                      ),
                    ],
                  ).px(8).py(4),
                ).pOnly(right: 30),
              ),
            ],
          );
        }),
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
                onTap: controller.convertEmailToUser,
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
                onTap: controller.clear,
              ),
            ),
          ],
        ).px(18),
      ],
    );
  }
}
