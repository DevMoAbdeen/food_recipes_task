import '../../../../core/networking/api/api_keys.dart';
import '../../domain/entities/users_response.dart';
import 'user_data_model.dart';

class UsersResponseModel extends UsersResponse {
  UsersResponseModel({
    required super.users,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      users: json[ApiKeys.users] != null
          ? (json[ApiKeys.users] as List<dynamic>?)
              ?.map((userJson) => UserDataModel.fromJson(userJson))
              .toList()
          : [],
      total: json[ApiKeys.total] ?? 0,
      skip: json[ApiKeys.skip] ?? 0,
      limit: json[ApiKeys.limit] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.users: users?.map((user) => UserDataModel.fromUserData(user).toMap()).toList(),
      ApiKeys.total: total,
      ApiKeys.skip: skip,
      ApiKeys.limit: limit,
    };
  }
}
