import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widget/app_bar_widget.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/screen_size_extensions.dart';
import '../../../settings/presentation/controller/cubits/settings_cubit.dart';
import '../../../settings/presentation/controller/states/settings_states.dart';
import '../controller/cubits/bottom_nav_cubit.dart';
import '../controller/states/bottom_nav_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BottomNavCubit>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(context.screenWidth(), 50),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return appBarWidget(
                context: context,
                textTitle: TranslationKeys.appName.translateValue(),
              );
            },
            buildWhen: (previous, current) => current is ChangeLanguage,
          ),
        ),
        body: BlocBuilder<BottomNavCubit, BottomNavStates>(
          builder: (context, state) {
            return IndexedStack(
              index: cubit.currentIndex,
              children: cubit.screens,
            );
          },
          buildWhen: (previous, current) => current is ChangeBottomNavIndex,
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavStates>(
          builder: (context, state) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: cubit.isBottomNavVisible ? 70 : 0,
              child: AnimatedScale(
                scale: cubit.isBottomNavVisible ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: NavigationBar(
                  destinations: [
                    NavigationDestination(
                      icon: const Icon(
                        Icons.food_bank_outlined,
                        color: Colors.black,
                      ),
                      label: TranslationKeys.recipes.translateValue(),
                      selectedIcon: const Icon(
                        Icons.food_bank,
                        color: Colors.white,
                      ),
                    ),
                    NavigationDestination(
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                      ),
                      label: TranslationKeys.users.translateValue(),
                      selectedIcon: const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                    ),
                    NavigationDestination(
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.black,
                      ),
                      label: TranslationKeys.settings.translateValue(),
                      selectedIcon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  selectedIndex: cubit.currentIndex,
                  onDestinationSelected: (value) => cubit.changeIndex(value),
                  animationDuration: const Duration(milliseconds: 800),
                  backgroundColor: Colors.white,
                  indicatorColor: Theme.of(context).primaryColor,
                  surfaceTintColor: Theme.of(context).primaryColor,
                  indicatorShape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
