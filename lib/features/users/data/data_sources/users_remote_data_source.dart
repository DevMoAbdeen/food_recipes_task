import '../../../../core/networking/api/api_controller.dart';
import '../../../../core/networking/api/api_urls.dart';
import '../../domain/entities/users_response.dart';
import '../models/users_response_model.dart';

abstract class UsersRemoteDataSource {
  Future<UsersResponse> getUsers(int skip, int limit);
}

class UsersRemoteDataSourceImplWithHttp implements UsersRemoteDataSource {
  final ApiController apiController;

  const UsersRemoteDataSourceImplWithHttp({required this.apiController});

  @override
  Future<UsersResponse> getUsers(int skip, int limit) async {
    final responseData = await apiController.get("${ApiURLs.getUsers}?skip=$skip&limit=$limit");

    UsersResponse response = UsersResponseModel.fromJson(responseData);
    return response;
  }
}
