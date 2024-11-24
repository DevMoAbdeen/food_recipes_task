import 'package:shared_preferences/shared_preferences.dart';

enum Keys {
  isLogged,
  languageCode,
  isDarkMode,
  cachedRecipes,
  cachedUsers,
}

enum LanguagesCodes { en, ar }

class SharedPrefController {
  late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData(Keys key, var value) async {
    if (value is String) return await _sharedPreferences.setString(key.name, value);
    if (value is int) return await _sharedPreferences.setInt(key.name, value);
    if (value is bool) return await _sharedPreferences.setBool(key.name, value);
    if (value is double) return await _sharedPreferences.setDouble(key.name, value);
    if (value is List<String>) return await _sharedPreferences.setStringList(key.name, value);
    return false;
  }

  dynamic getData({
    required Keys key,
  }) {
    return _sharedPreferences.get(key.name);
  }

  bool isKeyExist({required Keys key}) {
    return _sharedPreferences.containsKey(key.name);
  }

  Future<bool> removeData({required Keys key}) async {
    return await _sharedPreferences.remove(key.name);
  }

  Future<void> clearAllData() async {
    await _sharedPreferences.clear();
  }
}
