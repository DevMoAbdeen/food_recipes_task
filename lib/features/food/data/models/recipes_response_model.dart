import '../../../../features/food/data/models/recipe_model.dart';
import '../../../../core/networking/api/api_keys.dart';
import '../../domain/entities/recipes_response.dart';

class RecipesResponseModel extends RecipesResponse {
  RecipesResponseModel({
    required super.recipes,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory RecipesResponseModel.fromJson(Map<String, dynamic> json) {
    return RecipesResponseModel(
      recipes: json[ApiKeys.recipes] != null
          ? (json[ApiKeys.recipes] as List).map((recipeMap) => RecipeModel.fromJson(recipeMap)).toList()
          : [],
      total: json[ApiKeys.total] ?? 0,
      skip: json[ApiKeys.skip] ?? 0,
      limit: json[ApiKeys.limit] ?? 10,
    );
  }
}
