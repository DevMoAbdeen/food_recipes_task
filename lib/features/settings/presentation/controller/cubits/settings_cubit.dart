import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/translation_extension.dart';
import '../../../../../core/constant/translation_keys.dart';
import '../../../../../core/service_locator/dependency_injection.dart';
import '../../../../../infrastructure/shared_preferences.dart';
import '../../../../page_view/presentation/controller/cubits/bottom_nav_cubit.dart';
import '../states/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  Future<void> toggleTheme(bool isDarkMode) async {
    await getIt<SharedPrefController>().setData(Keys.isDarkMode, isDarkMode);
    emit(ChangeTheme());
  }

  Future<void> changeLanguage(BuildContext context, Locale locale) async {
    context.setLocale(locale);
    await getIt<SharedPrefController>().setData(Keys.languageCode, locale.languageCode);
    context.read<BottomNavCubit>().changeIndex(2);
    emit(ChangeLanguage());
  }

  String getLanguageNameFromCode(String language) {
    switch (language.toLowerCase()) {
      case "en":
        return TranslationKeys.english.translateValue();
      case "ar":
        return TranslationKeys.arabic.translateValue();
      default:
        return TranslationKeys.english.translateValue();
    }
  }
}
