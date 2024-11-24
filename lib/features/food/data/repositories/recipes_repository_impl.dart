import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../../../../core/networking/internet/internet_connection.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipes_response.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../data_sources/recipes_local_data_source.dart';
import '../data_sources/recipes_remote_data_source.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource remoteDataSource;
  final RecipesLocalDataSource localDataSource;
  final InternetConnection internetConnection;

  const RecipesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.internetConnection,
  });

  @override
  Future<Either<AppFailure, RecipesResponse>> getRecipes(int skip, int limit) async {
    if (await internetConnection.isConnected) {
      try {
        RecipesResponse recipesResponse = await remoteDataSource.getRecipes(skip, limit);
        if(skip == 0) {
          localDataSource.cacheRecipes(recipesResponse.recipes ?? []);
        }else{
          localDataSource.cacheMoreRecipes(recipesResponse.recipes ?? []);
        }
        return Right(recipesResponse);
      } catch (exception) {
        String errorMessage = AppFailure.getExceptionMessage(exception);
        return Left(AppFailure(message: errorMessage));
      }
    } else {
      try {
        List<Recipe> recipes = localDataSource.getCachedRecipes();
        RecipesResponse recipesResponse = RecipesResponse(
          recipes: recipes, total: recipes.length,
          limit: recipes.length, skip: 0,
        );
        return Right(recipesResponse);
      } catch (exception) {
        String errorMessage = AppFailure.getExceptionMessage(exception);
        return Left(AppFailure(message: errorMessage));
      }
    }
  }
}
