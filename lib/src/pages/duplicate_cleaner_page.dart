import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/controllers/duplicate_remover_controller.dart';
import 'package:textgenie/src/utils/text_genie_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class DuplicateRemoverPage extends StatelessWidget {
  const DuplicateRemoverPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DuplicateRemoverController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<DuplicateRemoverController>(builder: (controller) {
          return ListView(
            children: [
              20.heightBox,
              "Number of Lines: ${controller.fileLength}"
                  .text
                  .center
                  .xl
                  .make()
                  .px(30),
              const Divider().px(18).shimmer(
                    duration: 4.seconds,
                    primaryColor: Colors.purple,
                    secondaryColor: Colors.blue,
                  ),
              TextField(
                controller: controller.fileContentController,
                readOnly: true,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ).px(30).py(18),
              12.heightBox,
              'Status: '.richText.xl.center.withTextSpanChildren([
                ' ${controller.fileStatus}'
                    .textSpan
                    .bold
                    .color(
                      TextGenieUtils.fileStatusColor(
                        status: controller.fileStatus,
                      ),
                    )
                    .make(),
              ]).make(),
              const Divider().px(18).shimmer(
                    duration: 4.seconds,
                    primaryColor: Colors.purple,
                    secondaryColor: Colors.blue,
                  ),
              8.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await controller.importFile();
                    },
                    child: "Import File".text.make(),
                  ),
                  20.widthBox,
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      controller.removeDuplicates();
                    },
                    child: "Remove Duplicates".text.make(),
                  ),
                  20.widthBox,
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await controller.saveFile();
                    },
                    child: "Export File".text.make(),
                  ),
                  20.widthBox,
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: controller.clear,
                    child: "Clear".text.make(),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
