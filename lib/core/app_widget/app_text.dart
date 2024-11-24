import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String? fontFamily;
  final FontWeight fontWeight;
  final Color? color;
  final double? height;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final bool isUnderline;
  final bool isLineThrough;
  final double verticalPadding;
  final double horizontalPadding;

  const AppText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.height,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.isUnderline = false,
    this.isLineThrough = false,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          color: color ?? Theme.of(context).textTheme.bodyLarge!.color!,
          decoration: isUnderline
              ? TextDecoration.underline
              : isLineThrough
                  ? TextDecoration.lineThrough
                  : null,
          height: height,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
