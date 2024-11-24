import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../entities/users_response.dart';

abstract class UsersRepository {
  Future<Either<AppFailure, UsersResponse>> getUsers(int skip, int limit);
}
