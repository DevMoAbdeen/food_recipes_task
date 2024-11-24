import 'package:food_recipes_task/features/food/domain/entities/recipe.dart';

class RecipesResponse {
  final List<Recipe>? recipes;
  final int? total;
  final int? skip;
  final int? limit;

  RecipesResponse({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
