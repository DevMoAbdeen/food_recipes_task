import '../../../../../core/networking/api/api_keys.dart';
import '../../../domain/entities/response/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    required super.accessToken,
    required super.refreshToken,
    required super.id,
    required super.username,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.image,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json[ApiKeys.accessToken],
      refreshToken: json[ApiKeys.refreshToken],
      id: json[ApiKeys.id],
      username: json[ApiKeys.username],
      email: json[ApiKeys.email],
      firstName: json[ApiKeys.firstName],
      lastName: json[ApiKeys.lastName],
      gender: json[ApiKeys.gender],
      image: json[ApiKeys.image],
    );
  }
}
