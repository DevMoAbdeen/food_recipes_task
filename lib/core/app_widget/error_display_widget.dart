import 'package:flutter/material.dart';
import '../../core/extensions/translation_extension.dart';
import '../../core/extensions/sized_box_extension.dart';
import '../constant/app_colors.dart';
import '../constant/translation_keys.dart';
import 'app_text.dart';
import 'elevated_button_icon.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const ErrorDisplayWidget({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.errorSnackBarColor,
            size: 85,
          ),
          10.heightSpace(),
          AppText(
            text: TranslationKeys.errorOccurred.translateValue(),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            textAlign: TextAlign.center,
          ),
          8.heightSpace(),
          AppText(
            text: errorMessage,
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            maxLines: 15,
            horizontalPadding: 16,
            textAlign: TextAlign.center,
          ),
          30.heightSpace(),
          if (onRetry != null)
            ElevatedButtonIcon(
              text: TranslationKeys.retry.translateValue(),
              iconData: Icons.refresh,
              onCLickButton: () => onRetry!(),
            ),
        ],
      ),
    );
  }
}
