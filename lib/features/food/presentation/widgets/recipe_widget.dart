import 'package:flutter/material.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/routing/router_list.dart';
import '../../../../features/food/presentation/widgets/network_image_widget.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../domain/entities/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageWidget(
              imageUrl: recipe.image ?? "",
              height: 130,
              width: 120,
            ),
            16.widthSpace(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: recipe.name ?? TranslationKeys.noName.translateValue(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                  ),
                  8.heightSpace(),
                  Wrap(
                    children: [
                      Icon(Icons.star, color: Colors.yellow.shade600),
                      4.widthSpace(),
                      AppText(
                        text: recipe.rating?.toStringAsFixed(1) ?? "N/A",
                        fontSize: 16,
                        maxLines: 1,
                      ),
                      8.widthSpace(),
                      AppText(
                        text: "(${recipe.reviewCount ?? 0} ${TranslationKeys.reviews.translateValue()})",
                        fontSize: 16,
                        color: Theme.of(context).hintColor,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  8.heightSpace(),
                  AppText(
                    text: "${TranslationKeys.level.translateValue()} ${recipe.difficulty}",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    // color: Theme.of(context).primaryColor,
                  ),
                  // 8.heightSpace(),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RouterList.recipeDetailsScreen, arguments: recipe);
                    },
                    child: AppText(
                      text: TranslationKeys.viewDetails.translateValue(),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
