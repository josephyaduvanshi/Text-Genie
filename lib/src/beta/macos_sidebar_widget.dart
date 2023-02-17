import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'beta_combo_tools_page_controller.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComboToolsPageBetaController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              enableFeedback: true,
              splashColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(4),
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              leading: Icon(
                controller.items[index].icon,
                color: const Color.fromARGB(255, 147, 39, 190),
              ),
              title: controller.items[index].title.text.maxLines(1).make(),
              onTap: () {
                controller.onSelected(index);
                log("Selected Index: ${controller.selectedIndex.value}");
              },
            ),
          );
        },
      ).px(8);
    });
  }
}
