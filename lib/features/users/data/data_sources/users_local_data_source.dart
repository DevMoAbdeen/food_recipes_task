import 'dart:convert';
import '../../../../core/networking/error/app_exception.dart';
import '../../../../infrastructure/shared_preferences.dart';
import '../../domain/entities/user_data.dart';
import '../models/user_data_model.dart';

abstract class UsersLocalDataSource {
  Future<bool> cacheUsers(List<UserData> users);

  List<UserData> getCachedUsers();

  Future<bool> cacheMoreUsers(List<UserData> users);
}

class UsersLocalDataSourceImplWithSharedPref implements UsersLocalDataSource {
  final SharedPrefController sharedPref;

  const UsersLocalDataSourceImplWithSharedPref({required this.sharedPref});

  @override
  Future<bool> cacheUsers(List<UserData> users) async {
    List usersToJson = users.map((user) => UserDataModel.fromUserData(user).toMap()).toList();
    return await sharedPref.setData(Keys.cachedUsers, jsonEncode(usersToJson));
  }

  @override
  List<UserData> getCachedUsers() {
    final jsonString = sharedPref.getData(key: Keys.cachedUsers);

    if (jsonString == null) {
      throw EmptyCacheException();
    }

    List usersJson = jsonDecode(jsonString);
    return usersJson.map<UserDataModel>((json) => UserDataModel.fromJson(json)).toList();
  }

  @override
  Future<bool> cacheMoreUsers(List<UserData> users) async {
    List<UserData> allUsers = getCachedUsers();
    allUsers.addAll(users);

    return await cacheUsers(allUsers);
  }
}
