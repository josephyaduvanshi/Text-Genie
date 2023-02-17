import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleBar extends StatelessWidget {
  final void Function() onPressed;
  final IconData? icon;

  const ToggleBar({Key? key, required this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon ?? CupertinoIcons.sidebar_left,
      ),
    );
  }
}
