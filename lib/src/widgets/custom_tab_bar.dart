import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  final TabController? controller;
  final double? splashBorderRaius;
  final EdgeInsetsGeometry? padding;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? unselectedLabelColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final MaterialStateProperty<Color?>? overlayColor;
  final EdgeInsetsGeometry? indicatorPadding;
  final Decoration? indicator;
  final Color? indicatorColor;
  final List<Widget> tabs;
  final bool? isScrollable;

  const CustomTabBarWidget(
      {super.key,
      this.controller,
      this.splashBorderRaius,
      this.padding,
      this.labelColor,
      this.labelStyle,
      this.unselectedLabelStyle,
      this.splashFactory,
      this.overlayColor,
      this.indicatorPadding,
      this.indicator,
      this.indicatorColor,
      required this.tabs,
      this.isScrollable,
      this.unselectedLabelColor});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable ?? true,
      splashBorderRadius: BorderRadius.circular(splashBorderRaius ?? 0.0),
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      labelColor: labelColor ?? Colors.white,
      labelStyle: labelStyle ?? const TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelStyle:
          unselectedLabelStyle ?? const TextStyle(fontWeight: FontWeight.w700),
      splashFactory: splashFactory ?? NoSplash.splashFactory,
      overlayColor: overlayColor ??
          MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.focused)
                  ? null
                  : Colors.transparent;
            },
          ),
      indicatorPadding:
          indicatorPadding ?? const EdgeInsets.only(top: 8, bottom: 8),
      indicator: indicator ??
          BoxDecoration(
              color: const Color.fromARGB(255, 74, 45, 78),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: const Color.fromARGB(255, 195, 130, 180),
                width: 1,
              )),
      unselectedLabelColor:
          unselectedLabelColor ?? const Color.fromARGB(255, 195, 130, 180),
      tabs: tabs,
    );
  }
}
