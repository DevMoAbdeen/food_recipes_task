import '../../extensions/translation_extension.dart';
import '../../constant/translation_keys.dart';
import 'app_exception.dart';

class AppFailure {
  final String message;

  const AppFailure({required this.message});

  static String getExceptionMessage(Object exception) {
    switch (exception) {
      case ServerException():
        return exception.errorMessage;
      case UnauthorizedException():
        return exception.errorMessage;
      case NotFoundException():
        return exception.errorMessage;
      case WrongInputDataException():
        return exception.errorMessage;
      case AccountNotActivatedException():
        return exception.errorMessage;
      case TimeOutException():
        return TranslationKeys.timeoutFailure.translateValue();
      case EmptyCacheException():
        return TranslationKeys.emptyCacheFailure.translateValue();
      case UnexpectedException():
        return exception.errorMessage;
      default:
        return TranslationKeys.unexpectedError.translateValue();
    }
  }
}