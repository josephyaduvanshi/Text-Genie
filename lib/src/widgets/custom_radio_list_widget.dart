import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/constants.dart';
import 'custom_radio_tile.dart';

class CustomRadioListWidget extends StatelessWidget {
  final int groupValue;
  final void Function(int?) onChanged;
  const CustomRadioListWidget(
      {super.key, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 195, 130, 180),
          width: 1,
        ),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Constants.radioTilesList.length,
          itemBuilder: (context, index) {
            return CustomRadioTileWidget(
              groupValue: groupValue,
              onChanged: onChanged,
              title: Constants.radioTilesList[index].title,
              value: Constants.radioTilesList[index].value,
            );
          }),
    ).pOnly(right: 30);
  }
}
