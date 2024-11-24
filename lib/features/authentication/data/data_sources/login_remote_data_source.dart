import '../../../../core/networking/api/api_controller.dart';
import '../../../../core/networking/api/api_urls.dart';
import '../../domain/entities/request/login_request.dart';
import '../../domain/entities/response/login_response.dart';
import '../models/request/login_request_model.dart';
import '../models/response/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class LoginRemoteDataSourceImplWithHttp implements LoginRemoteDataSource {
  final ApiController apiController;

  LoginRemoteDataSourceImplWithHttp({required this.apiController});

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    LoginRequestModel loginRequestModel = LoginRequestModel(
      username: loginRequest.username,
      password: loginRequest.password,
      expiresInMinutes: loginRequest.expiresInMinutes,
    );
    final responseData = await apiController.post(ApiURLs.login, body: loginRequestModel.toJson());
    LoginResponse authResponse = LoginResponseModel.fromJson(responseData);

    return authResponse;
  }
}
