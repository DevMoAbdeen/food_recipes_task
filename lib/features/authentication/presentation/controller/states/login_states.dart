abstract class LoginStates {
  const LoginStates();
}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginError extends LoginStates {
  final String message;

  const LoginError({required this.message});
}

class LoginChangePasswordVisibility extends LoginStates {}
