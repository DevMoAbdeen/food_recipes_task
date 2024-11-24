import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../entities/request/login_request.dart';
import '../entities/response/login_response.dart';

abstract class LoginRepository {
  Future<Either<AppFailure, LoginResponse>> login(LoginRequest loginRequest);
}
