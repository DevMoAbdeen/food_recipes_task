import 'package:flutter/material.dart';
import '../app_widget/app_text.dart';
import '../constant/app_colors.dart';

enum SnackBarType { info, success, error , warning }

extension SnackBarExtensions on BuildContext {
  showSnackBar({
    required String message,
    required SnackBarType type,
    Color? iconColor,
    int secondsDuration = 4,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              type == SnackBarType.error
                  ? Icons.clear_outlined
                  : type == SnackBarType.warning
                      ? Icons.warning
                      : type == SnackBarType.success
                          ? Icons.check_circle
                          : Icons.info_outline,
              color: iconColor ?? Colors.white,
            ),
            Expanded(
              child: AppText(
                text: message,
                fontSize: 14,
                color: Colors.white,
                horizontalPadding: 8,
                maxLines: 6,
              ),
            ),
          ],
        ),
        backgroundColor: type == SnackBarType.error
            ? AppColors.errorSnackBarColor
            : type == SnackBarType.warning
                ? Colors.orangeAccent
                : type == SnackBarType.success
                    ? AppColors.successSnackBarColor
                    : Colors.blue,
        duration: Duration(seconds: secondsDuration),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
