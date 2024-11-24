import '../../../../core/networking/api/api_controller.dart';
import '../../../../core/networking/api/api_urls.dart';
import '../../domain/entities/recipes_response.dart';
import '../models/recipes_response_model.dart';

abstract class RecipesRemoteDataSource {
  Future<RecipesResponse> getRecipes(int skip, int limit);
}

class RecipesRemoteDataSourceImplWithHttp implements RecipesRemoteDataSource {
  final ApiController apiController;

  const RecipesRemoteDataSourceImplWithHttp({required this.apiController});

  @override
  Future<RecipesResponse> getRecipes(int skip, int limit) async {
    final responseData = await apiController.get("${ApiURLs.getRecipes}?skip=$skip&limit=$limit");

    RecipesResponse response = RecipesResponseModel.fromJson(responseData);
    return response;
  }
}
