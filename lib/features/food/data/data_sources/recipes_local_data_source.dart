import 'dart:convert';
import '../../../../core/networking/error/app_exception.dart';
import '../../../../infrastructure/shared_preferences.dart';
import '../../domain/entities/recipe.dart';
import '../models/recipe_model.dart';

abstract class RecipesLocalDataSource {
  Future<bool> cacheRecipes(List<Recipe> recipes);

  List<Recipe> getCachedRecipes();

  Future<bool> cacheMoreRecipes(List<Recipe> recipes);
}

class RecipesLocalDataSourceImplWithSharedPref implements RecipesLocalDataSource {
  final SharedPrefController sharedPref;

  const RecipesLocalDataSourceImplWithSharedPref({required this.sharedPref});

  @override
  Future<bool> cacheRecipes(List<Recipe> recipe) async {
    List recipesToJson = recipe.map((recipe) => RecipeModel.fromRecipe(recipe).toMap()).toList();
    return await sharedPref.setData(Keys.cachedRecipes, jsonEncode(recipesToJson));
  }

  @override
  List<Recipe> getCachedRecipes() {
    final jsonString = sharedPref.getData(key: Keys.cachedRecipes);

    if (jsonString == null) {
      throw EmptyCacheException();
    }

    List recipeJson = jsonDecode(jsonString);
    return recipeJson.map<RecipeModel>((json) => RecipeModel.fromJson(json)).toList();
  }

  @override
  Future<bool> cacheMoreRecipes(List<Recipe> recipes) async {
    List<Recipe> allRecipes = getCachedRecipes();
    allRecipes.addAll(recipes);

    return await cacheRecipes(allRecipes);
  }
}
