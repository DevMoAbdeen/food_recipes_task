import 'package:dartz/dartz.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../../../../core/networking/internet/internet_connection.dart';
import '../../domain/entities/request/login_request.dart';
import '../../domain/entities/response/login_response.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final InternetConnection internetConnection;

  LoginRepositoryImpl({required this.remoteDataSource, required this.internetConnection});

  @override
  Future<Either<AppFailure, LoginResponse>> login(LoginRequest loginRequest) async {
    if (await internetConnection.isConnected) {
      try {
        final loginResponse = await remoteDataSource.login(loginRequest);
        return Right(loginResponse);
      } catch (exception) {
        String errorMessage = AppFailure.getExceptionMessage(exception);
        return Left(AppFailure(message: errorMessage));
      }
    } else {
      return Left(AppFailure(message: TranslationKeys.internetFailure.translateValue()));
    }
  }
}
