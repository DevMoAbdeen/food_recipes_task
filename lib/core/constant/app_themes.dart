import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppThemes {
  // Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.mainColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    secondaryHeaderColor: AppColors.secondaryColorLight,
    cardColor: Colors.white,
    hintColor: Colors.grey,
    dividerColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColorLight,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: AppColors.textColorLight),
      bodySmall: TextStyle(color: AppColors.unselectedTextColorLight),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.mainColorLight,
      circularTrackColor: Colors.white,
    ),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.isNotEmpty) {
          return const TextStyle(
            color: AppColors.mainColorLight,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          );
        } else {
          return const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          );
        }
      }),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorLight,
    ),
  );

  // Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.mainColorDark,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    secondaryHeaderColor: AppColors.secondaryColorDark,
    cardColor: Colors.black,
    hintColor: Colors.grey,
    dividerColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColorDark,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: AppColors.textColorDark),
      bodySmall: TextStyle(color: AppColors.unselectedTextColorDark),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.mainColorDark,
      circularTrackColor: Colors.black,
    ),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.isNotEmpty) {
          return const TextStyle(
            color: AppColors.mainColorDark,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          );
        } else {
          return const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          );
        }
      }),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorDark,
    ),
  );
}
