import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../entities/request/login_request.dart';
import '../entities/response/login_response.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<AppFailure, LoginResponse>> call(LoginRequest loginRequest) async {
    return await repository.login(loginRequest);
  }
}
