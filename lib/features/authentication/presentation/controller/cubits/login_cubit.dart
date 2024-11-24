import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/service_locator/dependency_injection.dart';
import '../../../../../infrastructure/shared_preferences.dart';
import '../../../domain/entities/request/login_request.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../states/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(LoginInitial());

  final LoginUseCase _loginUseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? userNameText;
  String? passwordText;
  bool isVisible = false;

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      LoginRequest loginRequest = LoginRequest(
          username: userNameText!.trim(),
          password: passwordText!.trim(),
          expiresInMinutes: 90,
      );
      final loginResult = await _loginUseCase.call(loginRequest);

      loginResult.fold(
        (failure) {
          emit(LoginError(message: failure.message));
        },
        (loginResponse) {
          getIt<SharedPrefController>().setData(Keys.isLogged, true);
          emit(LoginSuccess());
        },
      );
    }
  }
  changePasswordVisibility(){
    isVisible = !isVisible;
    emit(LoginChangePasswordVisibility());
  }
}
