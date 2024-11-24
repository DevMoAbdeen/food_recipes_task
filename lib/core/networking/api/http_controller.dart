import 'dart:convert';
import 'dart:developer';
import 'package:food_recipes_task/core/app_widget/error_display_widget.dart';
import 'package:food_recipes_task/core/extensions/translation_extension.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/shared_preferences.dart';
import '../../constant/translation_keys.dart';
import '../../service_locator/dependency_injection.dart';
import '../error/app_exception.dart';
import 'api_controller.dart';
import 'api_keys.dart';

class HttpController extends ApiController {
  final int timeOutSeconds = 15;

  @override
  Future<Map<String, dynamic>> get(String uri, {Map<String, String>? headers}) async {
    http.Response response = await http.get(Uri.parse(uri), headers: headers ?? {
      "Content-Type": "application/json",
      "languageCode": getIt<SharedPrefController>().getData(key: Keys.languageCode) ?? "en",
    },).timeout(
      Duration(seconds: timeOutSeconds),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> post(String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    http.Response response = await http.post(Uri.parse(uri),  headers: headers ?? {
      "Content-Type": "application/json",
      "languageCode": getIt<SharedPrefController>().getData(key: Keys.languageCode) ?? "en",
    },
      body: jsonEncode(body),
    ).timeout(
      Duration(seconds: timeOutSeconds),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> put(String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    http.Response response = await http.put(Uri.parse(uri), headers: headers ?? {
      "Content-Type": "application/json",
      "languageCode": getIt<SharedPrefController>().getData(key: Keys.languageCode) ?? "en",
    },
    body: jsonEncode(body),
    ).timeout(
      Duration(seconds: timeOutSeconds),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> patch(String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    http.Response response = await http.patch(Uri.parse(uri), headers: headers ?? {
      "Content-Type": "application/json",
      "languageCode": getIt<SharedPrefController>().getData(key: Keys.languageCode) ?? "en",
    },
      body: jsonEncode(body),
    ).timeout(
      Duration(seconds: timeOutSeconds),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> delete(String uri, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    http.Response response = await http.delete(Uri.parse(uri), headers: headers ?? {
      "Content-Type": "application/json",
      "languageCode": getIt<SharedPrefController>().getData(key: Keys.languageCode) ?? "en",
    },
      body: jsonEncode(body),
    ).timeout(
      Duration(seconds: timeOutSeconds),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }


  static Map<String, dynamic> _handleResponse(http.Response response) {
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    log("Status Code is: ${response.statusCode}");
    log("Response body is: ${response.body}");

    switch (response.statusCode) {
      case >= 200 && < 300:
        return responseMap;
      case 400:
        throw WrongInputDataException(errorMessage: responseMap[ApiKeys.message] ?? TranslationKeys.wrongInputData.translateValue());
      case 401:
        throw UnauthorizedException(errorMessage: responseMap[ApiKeys.message] ?? TranslationKeys.unauthorized.translateValue());
      case 403:
        throw AccountNotActivatedException(errorMessage: responseMap[ApiKeys.message] ?? TranslationKeys.accountNotActivated.translateValue());
      case 404:
        throw NotFoundException(errorMessage: responseMap[ApiKeys.message] ?? TranslationKeys.notFound.translateValue());
      case >= 500 && < 600:
        throw ServerException(errorMessage: responseMap[ApiKeys.message] ?? TranslationKeys.serverError.translateValue());
      default:
        throw UnexpectedException(errorMessage: responseMap[ApiKeys.name] ?? TranslationKeys.unexpectedError.translateValue());
    }
  }

}
