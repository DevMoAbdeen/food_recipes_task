import 'package:flutter/material.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showProgress = false,
    this.borderColor,
    this.height = 60,
    this.borderRadius = 10,
    this.isUpperCase = false,
    this.fontWeight,
    this.textColor,
    this.fontSize,
    this.backgroundColor,
  });

  final String text;
  final Function() onPressed;
  final bool showProgress;
  final double height;
  final Color? borderColor;
  final double borderRadius;
  final bool isUpperCase;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          if (!showProgress) {
            onPressed();
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).primaryColor,
            foregroundBuilder: (context, states, child) {
              return Center(
                child: states.isEmpty || showProgress
                    ? child
                    : AppText(
                        text: text.toUpperCase(),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.white,
                      ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: 3),
        child: Center(
          child: showProgress
              ? const CircularProgressIndicator()
              : AppText(
                  text: isUpperCase ? text.toUpperCase() : text,
                  fontSize: fontSize ?? 18,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: textColor ?? Colors.white,
                ),
        ),
      ),
    );
  }
}
