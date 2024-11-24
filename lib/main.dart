import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constant/app_themes.dart';
import 'core/routing/app_routes.dart';
import 'core/routing/router_list.dart';
import 'core/service_locator/dependency_injection.dart';
import 'features/authentication/presentation/controller/cubits/login_cubit.dart';
import 'features/food/presentation/controller/cubits/recipes_cubit.dart';
import 'features/page_view/presentation/controller/cubits/bottom_nav_cubit.dart';
import 'features/settings/presentation/controller/cubits/settings_cubit.dart';
import 'features/settings/presentation/controller/states/settings_states.dart';
import 'features/users/presentation/controller/cubits/users_cubit.dart';
import 'infrastructure/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    EasyLocalization(
      supportedLocales: AppRouter.supportedLanguages.map((langCode) => Locale(langCode)).toList(),
      path: 'assets/translations',
      fallbackLocale: AppRouter.supportedLanguages.map((langCode) => Locale(langCode)).toList().first,
      child: const FoodRecipesApp(),
    ),
  );
}

class FoodRecipesApp extends StatelessWidget {
  const FoodRecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    String getDeviceLanguage() {
      try {
        Locale locale = PlatformDispatcher.instance.locale;
        return locale.languageCode;
      } catch (error) {
        return AppRouter.supportedLanguages.first;
      }
    }

    bool getDeviceIsDark() {
      try {
        Brightness brightness = MediaQuery.of(context).platformBrightness;
        if (brightness == Brightness.dark) {
          return true;
        } else {
          return false;
        }
      } catch (error) {
        return false;
      }
    }

    if (!getIt<SharedPrefController>().isKeyExist(key: Keys.languageCode)) {
      final sharedPref = getIt<SharedPrefController>();
      if (AppRouter.supportedLanguages.contains(getDeviceLanguage())) {
        sharedPref.setData(Keys.languageCode, getDeviceLanguage());
        context.setLocale(Locale(getDeviceLanguage()));
      } else {
        sharedPref.setData(Keys.languageCode, LanguagesCodes.en.name);
        context.setLocale(Locale(LanguagesCodes.en.name));
      }
    }

    if (!getIt<SharedPrefController>().isKeyExist(key: Keys.isDarkMode)) {
      getIt<SharedPrefController>().setData(Keys.isDarkMode, getDeviceIsDark());
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<BottomNavCubit>()),
        BlocProvider(create: (context) => getIt<RecipesCubit>()..getRecipes()),
        BlocProvider(create: (context) => getIt<UsersCubit>()..getUsers()),
        BlocProvider(create: (context) => getIt<SettingsCubit>()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            title: "Food Recipes",
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: AppRouter.supportedLanguages.map((e) => Locale(e)),
            locale: Locale(getIt<SharedPrefController>().getData(key: Keys.languageCode) ?? LanguagesCodes.en.name),
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: getIt<SharedPrefController>().getData(key: Keys.isDarkMode) == null ||
                getIt<SharedPrefController>().getData(key: Keys.isDarkMode) == false
                ? ThemeMode.light
                : ThemeMode.dark,
            initialRoute: RouterList.splashScreen,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
        buildWhen: (previous, current) =>
            current is ChangeLanguage || current is ChangeTheme,
      ),
    );
  }
}
