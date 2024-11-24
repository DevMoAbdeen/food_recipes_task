import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/food/presentation/screens/recipes_screen.dart';
import '../../features/food/presentation/screens/recipe_details_screen.dart';
import '../../features/page_view/presentation/screens/main_screen.dart';
import '../../features/splash/presentation/controller/cubit/splash_cubit.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/users/presentation/screens/user_details_screen.dart';
import '../../features/users/presentation/screens/users_screen.dart';
import '../app_widget/app_text.dart';
import '../constant/app_colors.dart';
import '../service_locator/dependency_injection.dart';
import 'router_list.dart';

abstract class AppRouter {
  static List<String> supportedLanguages = ["en", "ar"];

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterList.splashScreen:
        return _buildRoute(settings,
            builder: BlocProvider(
                create: (context) => getIt<SplashCubit>(),
                child: const SplashScreen(),
            ),
        );

      case RouterList.loginScreen:
        return _buildRoute(settings, builder: const LoginScreen());

      case RouterList.mainScreen:
        return _buildRoute(settings, builder: const MainScreen());

      case RouterList.recipesScreen:
        return _buildRoute(settings, builder: const RecipesScreen());

      case RouterList.recipeDetailsScreen:
        return _buildRoute(settings, builder: const RecipeDetailsScreen());

      case RouterList.usersScreen:
        return _buildRoute(settings, builder: const UsersScreen());

      case RouterList.userDetailsScreen:
        return _buildRoute(settings, builder: const UserDetailsScreen());

      default:
        return _errorRoute(settings.name ?? "null");
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings, {
    required Widget builder,
    maintainState = true,
    fullscreenDialog = false,
    allowSnapshotting = true,
    barrierDismissible = false,
  }) {
    return MaterialPageRoute(
      builder: (context) => builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
    );
  }

  static Route _errorRoute(String routeName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: "Page not found",
            fontSize: 18,
            color: Colors.white,
          ),
          backgroundColor: AppColors.mainColorLight,
        ),
        body: Center(
          child: AppText(
            text: "No route in app defined for: $routeName",
            fontSize: 16,
            textAlign: TextAlign.center,
            maxLines: 3,
            horizontalPadding: 16,
          ),
        ),
      );
    });
  }
}
