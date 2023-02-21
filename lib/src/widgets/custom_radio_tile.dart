import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomRadioTileWidget extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final void Function(int?) onChanged;
  const CustomRadioTileWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        title.text.isIntrinsic.semiBold.make(),
      ],
    );
  }
}
