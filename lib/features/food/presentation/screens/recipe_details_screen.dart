import 'package:flutter/material.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/app_widget/app_button.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../domain/entities/recipe.dart';
import '../widgets/network_image_widget.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late Recipe recipe;
    try{
      Recipe? argumentRecipe = ModalRoute.of(context)?.settings.arguments as Recipe;
      recipe = argumentRecipe;
    }catch(e){
      context.pop();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: AppText(
                text: recipe.name ?? TranslationKeys.noName.translateValue(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              background: NetworkImageWidget(imageUrl: recipe.image ?? ""),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      const Spacer(),
                      AppText(
                        text: "${TranslationKeys.level.translateValue()} ${recipe.difficulty}",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  16.heightSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailsIcon(
                        icon: Icons.access_time,
                        label: "${recipe.prepTimeMinutes ?? 0} ${TranslationKeys.minutes.translateValue()}",
                      ),
                      DetailsIcon(
                        icon: Icons.local_fire_department,
                        label: "${recipe.caloriesPerServing ?? 0} ${TranslationKeys.kcal.translateValue()}",
                      ),
                      DetailsIcon(
                        icon: Icons.group,
                        label: "${recipe.servings ?? 0} ${TranslationKeys.servings.translateValue()}",
                      ),
                    ],
                  ),
                  16.heightSpace(),
                  AppText(
                    text: TranslationKeys.ingredients.translateValue(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  8.heightSpace(),
                  ...?recipe.ingredients?.map(
                    (ingredient) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, size: 18, color: Theme.of(context).primaryColor),
                        8.widthSpace(),
                        Expanded(
                          child: AppText(
                            text: ingredient,
                            fontSize: 15,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.heightSpace(),
                  AppText(
                    text: TranslationKeys.instructions.translateValue(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  8.heightSpace(),
                  ...?recipe.instructions?.asMap().entries.map(
                        (entry) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "${entry.key + 1}. ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            Expanded(
                              child: AppText(
                                text: entry.value,
                                fontSize: 15,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                  30.heightSpace(),
                  AppButton(
                    text: TranslationKeys.backToRecipes.translateValue(),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const DetailsIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 32),
        const SizedBox(height: 4),
        AppText(
          text: label,
          fontSize: 14,
        ),
      ],
    );
  }
}
