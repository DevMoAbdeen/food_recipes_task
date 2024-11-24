import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../entities/users_response.dart';
import '../repositories/users_repository.dart';

class GetUsersUseCase {
  final UsersRepository repository;

  GetUsersUseCase(this.repository);

  Future<Either<AppFailure, UsersResponse>> call(int skip, int limit) async {
    return await repository.getUsers(skip, limit);
  }
}
