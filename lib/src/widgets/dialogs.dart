import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:textgenie/src/widgets/custom_button_with_icon.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDialog {
  static Future<Object?> historyPreviewDialog(
      {required BuildContext context, required String content}) async {
    final dialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "Limited Preview(Results)"
              .text
              .xl
              .isIntrinsic
              .semiBold
              .make()
              .shimmer(
                duration: 4.seconds,
                primaryColor: Colors.purple,
                secondaryColor: Colors.blue,
              ),
          const Divider(
            thickness: 0.8,
            color: Colors.blue,
          ).px(6).shimmer(
                duration: 4.seconds,
                primaryColor: Colors.purple,
                secondaryColor: Colors.blue,
              ),
          SelectionArea(
            selectionControls: materialTextSelectionControls,
            child: SingleChildScrollView(
                child: content.text.caption(context).isIntrinsic.make().px(8)),
          ),
          const Divider(
            thickness: 0.8,
            color: Colors.blue,
          ).px(6).shimmer(
                duration: 4.seconds,
                primaryColor: Colors.purple,
                secondaryColor: Colors.blue,
              ),
          "This is a limited preview of the history. "
                  "To view the full content, please open the file."
              .text
              .bold
              .caption(context)
              .color(Colors.blueGrey)
              .isIntrinsic
              .make()
              .px(8),
          12.heightBox,
          CustomButtonWithIcon(
            height: 32,
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Close',
            alignLeft: true,
            isImage: false,
            iconData: Icons.close_rounded,
          ).px(8)
        ],
      ),
    );
    return await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: dialog,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, anim1, anim2) => dialog,
    );
  }
}
