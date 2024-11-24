import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/translation_keys.dart';
import '../../../../../core/extensions/translation_extension.dart';
import '../../../../food/presentation/screens/recipes_screen.dart';
import '../../../../settings/presentation/screens/settings_screen.dart';
import '../../../../users/presentation/screens/users_screen.dart';
import '../states/bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitial());

  int currentIndex = 0;
  bool isBottomNavVisible = true;

  // List<NavigationDestination> destinations = [
  //   NavigationDestination(
  //     icon: const Icon(
  //       Icons.food_bank_outlined,
  //       color: Colors.black,
  //     ),
  //     label: TranslationKeys.recipes.translateValue(),
  //     selectedIcon: const Icon(
  //       Icons.food_bank,
  //       color: Colors.white,
  //     ),
  //   ),
  //   NavigationDestination(
  //     icon: const Icon(
  //       Icons.account_circle_outlined,
  //       color: Colors.black,
  //     ),
  //     label: TranslationKeys.users.translateValue(),
  //     selectedIcon: const Icon(
  //       Icons.account_circle,
  //       color: Colors.white,
  //     ),
  //   ),
  //   NavigationDestination(
  //     icon: const Icon(
  //       Icons.settings_outlined,
  //       color: Colors.black,
  //     ),
  //     label: TranslationKeys.settings.translateValue(),
  //     selectedIcon: const Icon(
  //       Icons.settings,
  //       color: Colors.white,
  //     ),
  //   ),
  // ];

  final List<Widget> screens = [
    const RecipesScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  changeIndex(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(ChangeBottomNavIndex());
    }
  }

  changeBottomNavVisible(bool isNavVisible) {
    if (isBottomNavVisible != isNavVisible) {
      isBottomNavVisible = isNavVisible;
      emit(ChangeBottomNavVisible());
    }
  }
}
