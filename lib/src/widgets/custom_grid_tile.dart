import 'package:flutter/material.dart';

class CustomGridTile extends StatelessWidget {
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final VoidCallback onTap;
  final Widget child;
  final InteractiveInkFeatureFactory? splashFactory;
  final double? elevation;
  const CustomGridTile(
      {super.key,
      this.borderRadius,
      this.boxShadow,
      required this.onTap,
      required this.child,
      this.elevation,
      this.splashFactory});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        elevation: elevation ?? 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              onTap: onTap,
              splashFactory: splashFactory ?? NoSplash.splashFactory,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
