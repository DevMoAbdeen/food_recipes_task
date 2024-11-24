import 'package:flutter/material.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../features/food/presentation/widgets/recipe_widget.dart';
import '../../domain/entities/recipe.dart';

class RecipesListViewWidget extends StatelessWidget {
  final List<Recipe> recipes;
  final bool isLoadingMore;

  const RecipesListViewWidget({
    super.key,
    required this.recipes,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length + 1,
      cacheExtent: 100,
      itemBuilder: (context, index) {
        if (index == recipes.length) {
          return isLoadingMore
              ? const SizedBox(height: 50, child: Center(child: CircularProgressIndicator()))
              : 0.heightSpace();
        }

        return RecipeWidget(recipe: recipes[index]);
      },
    );
  }
}
