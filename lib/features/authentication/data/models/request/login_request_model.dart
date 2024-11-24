import '../../../../../core/networking/api/api_keys.dart';
import '../../../domain/entities/request/login_request.dart';

class LoginRequestModel extends LoginRequest {
  LoginRequestModel({
    required super.username,
    required super.password,
    required super.expiresInMinutes,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.userName: username,
      ApiKeys.password: password,
      ApiKeys.expiresInMinutes: expiresInMinutes,
    };
  }
}
