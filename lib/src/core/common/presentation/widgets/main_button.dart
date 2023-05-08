import 'package:flutter/material.dart';
import 'package:articles/src/core/core.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.label,
      this.width,
      this.height,
      this.borderWidth,
      this.onPressed,
      this.backgroundColor,
      this.borderColor,
      this.isSecondary = false,
      this.hasBorder,
      this.borderRadius,
      this.textStyle,
      this.icon})
      : super(key: key);
  final double? width;
  final double? height;
  final double? borderWidth;
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool? hasBorder;
  final bool isSecondary;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? SizeConfig.h(40),
        width: width ?? SizeConfig.w(160),
        decoration: BoxDecoration(
            border:
                hasBorder == null || hasBorder! ? Border.all(color: borderColor ?? Theme.of(context).primaryColor, width: borderWidth ?? 1.5) : null,
            borderRadius: borderRadius ?? basicBorderRadius,
            color: backgroundColor ?? Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(
                width: SizeConfig.w(10),
              )
            ],
            Text(
              label,
              style: textStyle ?? AppTextStyle.regular(sizeText: SizeText.size14).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
