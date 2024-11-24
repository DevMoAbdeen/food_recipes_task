import '../../../../core/networking/api/api_keys.dart';
import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.id,
    required super.name,
    required super.ingredients,
    required super.instructions,
    required super.prepTimeMinutes,
    required super.cookTimeMinutes,
    required super.servings,
    required super.difficulty,
    required super.cuisine,
    required super.caloriesPerServing,
    required super.tags,
    required super.userId,
    required super.image,
    required super.rating,
    required super.reviewCount,
    required super.mealType,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      ingredients: List<String>.from(json[ApiKeys.ingredients]),
      instructions: List<String>.from(json[ApiKeys.instructions]),
      prepTimeMinutes: json[ApiKeys.prepTimeMinutes],
      cookTimeMinutes: json[ApiKeys.cookTimeMinutes],
      servings: json[ApiKeys.servings],
      difficulty: json[ApiKeys.difficulty],
      cuisine: json[ApiKeys.cuisine],
      caloriesPerServing: json[ApiKeys.caloriesPerServing],
      tags: List<String>.from(json[ApiKeys.tags]),
      userId: json[ApiKeys.userId],
      image: json[ApiKeys.image],
      rating: json[ApiKeys.rating].toDouble(),
      reviewCount: json[ApiKeys.reviewCount],
      mealType: List<String>.from(json[ApiKeys.mealType]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.id: id,
      ApiKeys.name: name,
      ApiKeys.ingredients: ingredients,
      ApiKeys.instructions: instructions,
      ApiKeys.prepTimeMinutes: prepTimeMinutes,
      ApiKeys.cookTimeMinutes: cookTimeMinutes,
      ApiKeys.servings: servings,
      ApiKeys.difficulty: difficulty,
      ApiKeys.cuisine: cuisine,
      ApiKeys.caloriesPerServing: caloriesPerServing,
      ApiKeys.tags: tags,
      ApiKeys.userId: userId,
      ApiKeys.image: image,
      ApiKeys.rating: rating,
      ApiKeys.reviewCount: reviewCount,
      ApiKeys.mealType: mealType,
    };
  }

  factory RecipeModel.fromRecipe(Recipe recipe) {
    return RecipeModel(
      id: recipe.id,
      name: recipe.name,
      ingredients: recipe.ingredients,
      instructions: recipe.instructions,
      prepTimeMinutes: recipe.prepTimeMinutes,
      cookTimeMinutes: recipe.cookTimeMinutes,
      servings: recipe.servings,
      difficulty: recipe.difficulty,
      cuisine: recipe.cuisine,
      caloriesPerServing: recipe.caloriesPerServing,
      tags: recipe.tags,
      userId: recipe.userId,
      image: recipe.image,
      rating: recipe.rating,
      reviewCount: recipe.reviewCount,
      mealType: recipe.mealType,
    );
  }
}
