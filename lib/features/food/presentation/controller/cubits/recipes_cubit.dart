import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/use_cases/get_recipes_use_case.dart';
import '../states/recipes_states.dart';

class RecipesCubit extends Cubit<RecipesStates> {
  final GetRecipesUseCase _getRecipesUseCase;

  RecipesCubit({required GetRecipesUseCase getRecipesUseCase})
      : _getRecipesUseCase = getRecipesUseCase,
        super(RecipesLoading());

  List<Recipe> _recipes = [];
  List<Recipe> get getRecipesList => _recipes;
  int _skip = 0;
  late int _total;
  final int _limit = 10;

  bool isLoadingData = false;

  getRecipes() async {
    if (state is! RecipesLoading) {
      emit(RecipesLoading());
    }
    final recipesResult = await _getRecipesUseCase.call(_skip, _limit);
    recipesResult.fold(
      (failure) {
        emit(RecipesError(errorMessage: failure.message));
      },
      (recipesResponse) {
        _recipes = recipesResponse.recipes!;
        _total = recipesResponse.total!;
        _skip = _recipes.length;
        emit(RecipesLoaded());
      },
    );
  }

  getMoreRecipes() async {
    if (_recipes.length < _total && !isLoadingData) {
      isLoadingData = true;
      emit(GetMoreRecipesLoading());
      final recipesResult = await _getRecipesUseCase(_skip, _limit);
      isLoadingData = false;

      recipesResult.fold(
        (failure) {
          emit(GetMoreRecipesError(errorMessage: failure.message));
        },
        (recipesResponse) {
          List<Recipe> newRecipes = recipesResponse.recipes!;
          _recipes.addAll(newRecipes);
          _skip = _recipes.length;
          emit(RecipesLoaded());
        },
      );
    }
  }
}
