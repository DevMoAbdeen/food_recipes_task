import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../entities/recipes_response.dart';

abstract class RecipesRepository {
  Future<Either<AppFailure, RecipesResponse>> getRecipes(int skip, int limit);
}
