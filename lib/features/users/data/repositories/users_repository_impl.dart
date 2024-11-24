import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/app_failure.dart';
import '../../../../core/networking/internet/internet_connection.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/entities/users_response.dart';
import '../../domain/repositories/users_repository.dart';
import '../data_sources/users_local_data_source.dart';
import '../data_sources/users_remote_data_source.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource remoteDataSource;
  final UsersLocalDataSource localDataSource;
  final InternetConnection internetConnection;

  const UsersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.internetConnection,
  });

  @override
  Future<Either<AppFailure, UsersResponse>> getUsers(int skip, int limit) async {
    if (await internetConnection.isConnected) {
      try {
        UsersResponse usersResponse = await remoteDataSource.getUsers(skip, limit);
        if(skip == 0) {
          localDataSource.cacheUsers(usersResponse.users ?? []);
        }else{
          localDataSource.cacheMoreUsers(usersResponse.users ?? []);
        }
        return Right(usersResponse);
      } catch (exception) {
        log("Error is: ${exception.toString()}");
        String errorMessage = AppFailure.getExceptionMessage(exception);
        return Left(AppFailure(message: errorMessage));
      }
    } else {
      try {
        List<UserData> users = localDataSource.getCachedUsers();
        UsersResponse usersResponse = UsersResponse(
          users: users, total: users.length,
          limit: users.length, skip: 0,
        );
        return Right(usersResponse);
      } catch (exception) {
        log("Error is: ${exception.toString()}");
        String errorMessage = AppFailure.getExceptionMessage(exception);
        return Left(AppFailure(message: errorMessage));
      }
    }
  }
}