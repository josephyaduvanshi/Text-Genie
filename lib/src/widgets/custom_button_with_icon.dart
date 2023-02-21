import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final void Function()? onTap;
  final bool alignLeft;
  final String title;
  final String? imageString;
  final Color? textColor;
  final Color? hightLightColor;
  final Color? splashColor;
  final Color? backgroundColor;
  final double? textScale;
  final double? imageHeight;
  final double? textPx;
  final double? height;
  final double? width;
  final double? textPy;
  final double? borderRadius;
  final bool isImage;
  final IconData? iconData;
  final FontWeight? fontWeight;
  final double? textPxRow;
  final double? textPOnlyRight;
  final double? textPOnlyLeft;
  final double? textPOnlyTop;
  final double? textPOnlyBottom;
  const CustomButtonWithIcon(
      {Key? key,
      required this.onTap,
      required this.title,
      this.imageString,
      this.textColor,
      required this.alignLeft,
      this.textScale,
      this.textPx,
      this.textPy,
      this.textPxRow,
      this.textPOnlyRight,
      this.textPOnlyLeft,
      this.textPOnlyTop,
      this.textPOnlyBottom,
      this.fontWeight,
      this.hightLightColor,
      this.splashColor,
      this.backgroundColor,
      this.borderRadius,
      this.height,
      this.imageHeight,
      required this.isImage,
      this.iconData,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        highlightColor: hightLightColor ?? Colors.blue.withOpacity(0.9),
        splashColor: splashColor ?? Colors.green.withOpacity(1),
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        onTap: onTap,
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.red.shade400,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          child: alignLeft
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isImage
                        ? Flexible(
                            child: Image.asset(
                              imageString!,
                              height: imageHeight ?? 29,
                            ),
                          )
                        : Icon(
                            iconData,
                            color: textColor ?? Colors.white,
                          ),
                    4.widthBox,
                    title.text.isIntrinsic
                        .scale(textScale ?? 1.25)
                        .color(textColor ?? Colors.white)
                        .textStyle(TextStyle(
                          fontWeight: fontWeight ?? FontWeight.w600,
                        ))
                        .make()
                        .px(textPx ?? 4)
                        .py(textPy ?? 0)
                        .pOnly(
                            right: textPOnlyRight ?? 0,
                            left: textPOnlyLeft ?? 0,
                            bottom: textPOnlyBottom ?? 0,
                            top: textPOnlyTop ?? 0),
                  ],
                ).px(textPxRow ?? 0)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title.text.isIntrinsic
                        .scale(textScale ?? 1.25)
                        .color(textColor ?? Colors.white)
                        .textStyle(TextStyle(
                          fontWeight: fontWeight ?? FontWeight.w600,
                        ))
                        .make()
                        .px(textPx ?? 4)
                        .py(textPy ?? 0)
                        .pOnly(
                            right: textPOnlyRight ?? 0,
                            left: textPOnlyLeft ?? 0,
                            bottom: textPOnlyBottom ?? 0,
                            top: textPOnlyTop ?? 0),
                    4.widthBox,
                    isImage
                        ? Flexible(
                            child: Image.asset(
                              imageString!,
                              height: imageHeight ?? 29,
                            ),
                          )
                        : Icon(
                            iconData,
                            color: textColor ?? Colors.white,
                          ),
                  ],
                ).px(textPxRow ?? 0),
        ),
      ),
    );
  }
}
