import 'package:flutter/material.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/constant/translation_keys.dart';

class NoRecipesWidget extends StatelessWidget {
  const NoRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.hourglass_empty,
              color: Colors.grey.shade500,
              size: 85,
            ),
            15.heightSpace(),
            AppText(
              text: TranslationKeys.noPostsYet.translateValue(),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            10.heightSpace(),
            AppText(
              text: TranslationKeys.noPostsHere.translateValue(),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.6),
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
