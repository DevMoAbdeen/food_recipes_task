abstract class RecipesStates {}

class RecipesLoaded extends RecipesStates {}

class RecipesLoading extends RecipesStates {}

class GetMoreRecipesLoading extends RecipesStates {}

class GetMoreRecipesError extends RecipesStates {
  final String errorMessage;

  GetMoreRecipesError({required this.errorMessage});
}

class RecipesError extends RecipesStates {
  final String errorMessage;

  RecipesError({required this.errorMessage});
}
