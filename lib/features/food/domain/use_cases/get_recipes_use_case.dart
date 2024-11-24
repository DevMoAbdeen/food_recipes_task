import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../entities/recipes_response.dart';
import '../repositories/recipes_repository.dart';

class GetRecipesUseCase {
  final RecipesRepository repository;

  GetRecipesUseCase(this.repository);

  Future<Either<AppFailure, RecipesResponse>> call(int skip, int limit) async {
    return await repository.getRecipes(skip, limit);
  }
}
