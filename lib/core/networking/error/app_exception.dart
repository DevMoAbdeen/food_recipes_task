/// /////////////// Api Exceptions /////////////// ///
class ServerException implements Exception {
  final String errorMessage;

  ServerException({required this.errorMessage});
}

class UnauthorizedException implements Exception {
  final String errorMessage;

  UnauthorizedException({required this.errorMessage});
}

class NotFoundException implements Exception {
  final String errorMessage;

  NotFoundException({required this.errorMessage});
}

class NoInternetException implements Exception {}

class TimeOutException implements Exception {}

/// /////////////// Authentications Exceptions /////////////// ///

class WrongInputDataException implements Exception {
  final String errorMessage;

  WrongInputDataException({required this.errorMessage});
}

class AccountNotActivatedException implements Exception {
  final String errorMessage;

  const AccountNotActivatedException({required this.errorMessage});
}

/// /////////////// Other Exceptions /////////////// ///

class EmptyCacheException implements Exception {}

class UnexpectedException implements Exception {
  final String errorMessage;

  UnexpectedException({required this.errorMessage});
}
