import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class CustomSwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  final String switchTitle;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? borderColor;
  final double? separatorWidth;
  final double? borderRadius;
  final double? borderWidth;
  final double? separatorHeight;
  final SizedBox? separator;
  final double? paddingRight;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingBottom;
  final double? switchPaddingPx;
  final double? switchPaddingPy;
  const CustomSwitchWidget(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.switchTitle,
      this.mainAxisAlignment,
      this.borderColor,
      this.separatorWidth,
      this.separatorHeight,
      this.separator,
      this.borderWidth,
      this.borderRadius,
      this.paddingRight,
      this.paddingLeft,
      this.paddingTop,
      this.paddingBottom,
      this.switchPaddingPx,
      this.switchPaddingPy});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        border: Border.all(
          color: borderColor ?? const Color.fromARGB(255, 195, 130, 180),
          width: borderWidth ?? 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          Expanded(
            child: switchTitle.text.semiBold.make(),
          ),
          separator ?? 8.widthBox,
          Container(
            height: separatorHeight ?? 50,
            width: separatorWidth ?? 1,
            color: borderColor ?? const Color.fromARGB(255, 195, 130, 180),
          ),
          separator ?? 8.widthBox,
          Expanded(
            child: Switch(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ).px(switchPaddingPx ?? 8).py(switchPaddingPy ?? 4),
    ).pOnly(
      right: paddingRight ?? 30,
      left: paddingLeft ?? 0,
      top: paddingTop ?? 0,
      bottom: paddingBottom ?? 0,
    );
  }
}
