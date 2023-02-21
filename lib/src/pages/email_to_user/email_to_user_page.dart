import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/controllers/email_to_user_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import 'email_to_user_history.dart';
import 'email_to_user_tool.dart';

class EmailToUserPage extends StatelessWidget {
  const EmailToUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Email to User'),
        elevation: 3,
      ),
      body: GetBuilder<EmailToUserController>(builder: (controller) {
        return Column(
          children: [
            CupertinoSlidingSegmentedControl(
              children: {
                0: "Tool".text.semiBold.isIntrinsic.make(),
                1: "History".text.semiBold.isIntrinsic.make(),
              },
              onValueChanged: controller.onChangeTab,
              groupValue: controller.selectedTab,
            ),
            _returnWidget(controller.selectedTab, controller),
          ],
        ).p(12);
      }),
    );
  }

  Widget _returnWidget(int value, EmailToUserController controller) {
    final Map<int, Widget> widgets = {
      0: EmailToUserToolWidget(
        controller: controller,
      ),
      1: EmailToUserHistory(
        box: controller.box,
      ),
    };
    return widgets[value] ?? Container();
  }
}
