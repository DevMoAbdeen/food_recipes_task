import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/navigation_extension.dart';
import '../../../../../core/extensions/screen_size_extensions.dart';
import '../../../../../core/routing/router_list.dart';
import '../../../../../core/service_locator/dependency_injection.dart';
import '../../../../../infrastructure/shared_preferences.dart';
import '../states/splash_states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitial());

  double ballY = 0;
  double widthVal = 50;
  double heightVal = 50;
  double bottomVal = 500;
  int times = 0;
  bool add = false;
  bool showShadow = false;
  bool showLogo = false;

  changeValueListener(BuildContext context, Function controllerFunctions) {
    if (add) {
      ballY += 15;
    } else {
      ballY -= 15;
    }
    if (ballY <= -200) {
      times += 1;
      add = true;
      showShadow = true;
    }
    if (ballY >= 0) {
      add = false;
      showShadow = false;
      widthVal += 200;
      heightVal += 200;
      bottomVal -= 200;
    }
    if (times == 3) {
      showShadow = false;
      widthVal = context.screenWidth();
      heightVal = context.screenHeight();
      Timer(const Duration(milliseconds: 200), () {
        showLogo = true;
        controllerFunctions();
        emit(SplashChangeValues());
        _navigateNextPage(context);
      });
    }
    emit(SplashChangeValues());
  }

  void _navigateNextPage(BuildContext context) async {
    Timer(const Duration(seconds: 1), () {
      String nextPage = _nameNextPage();
      context.pushNamedAndRemoveAll(nextPage);
    });
  }

  String _nameNextPage() {
    final sharedPref = getIt<SharedPrefController>();
    return sharedPref.getData(key: Keys.isLogged) == null ||
            sharedPref.getData(key: Keys.isLogged) == false
        ? RouterList.loginScreen
        : RouterList.mainScreen;
  }
}
