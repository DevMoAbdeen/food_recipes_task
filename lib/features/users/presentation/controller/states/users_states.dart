abstract class UsersStates {}

class UsersLoaded extends UsersStates {}

class UsersLoading extends UsersStates {}

class GetMoreUsersLoading extends UsersStates {}

class GetMoreUsersError extends UsersStates {
  final String errorMessage;

  GetMoreUsersError({required this.errorMessage});
}

class UsersError extends UsersStates {
  final String errorMessage;

  UsersError({required this.errorMessage});
}
