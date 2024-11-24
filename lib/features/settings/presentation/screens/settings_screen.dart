import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/service_locator/dependency_injection.dart';
import '../../../../infrastructure/shared_preferences.dart';
import '../controller/cubits/settings_cubit.dart';
import '../controller/states/settings_states.dart';
import '../widgets/contact_with_me_widget.dart';
import '../widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.heightSpace(),
                SectionTitle(
                    text: TranslationKeys.contactInfo.translateValue()),
                ExpansionTile(
                  leading: const Icon(Icons.perm_contact_cal),
                  title: AppText(
                    text: TranslationKeys.contactWithMe.translateValue(),
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  iconColor: Theme.of(context).primaryColor,
                  children: [
                    4.heightSpace(),
                    ContactWithMeWidget(
                      appIcon: AppImages.github,
                      appName: TranslationKeys.github.translateValue(),
                      myAppLink: "https://github.com/DevMoAbdeen",
                    ),
                    4.heightSpace(),
                    ContactWithMeWidget(
                      appIcon: AppImages.whatsapp,
                      appName: TranslationKeys.whatsapp.translateValue(),
                      myAppLink: "https://wa.me/+970599597469",
                    ),
                    4.heightSpace(),
                    ContactWithMeWidget(
                      appIcon: AppImages.linkedin,
                      appName: TranslationKeys.linkedin.translateValue(),
                      myAppLink: "https://www.linkedin.com/in/devmoabdeen/",
                    ),
                    4.heightSpace(),
                    ContactWithMeWidget(
                      appIcon: AppImages.telegram,
                      appName: TranslationKeys.telegram.translateValue(),
                      myAppLink: "https://t.me/+970599597469",
                    ),
                  ],
                ),
                32.heightSpace(),
                SectionTitle(text: TranslationKeys.appInfo.translateValue()),
                SettingsItem(
                  title: TranslationKeys.appDescription.translateValue(),
                  subtitle: TranslationKeys.learnMoreAboutApp.translateValue(),
                  icon: Icons.info,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AppDescriptionDialog(),
                    );
                  },
                ),
                SettingsItem(
                  title: TranslationKeys.appVersion.translateValue(),
                  subtitle: TranslationKeys.version.translateValue(),
                  icon: Icons.verified,
                  onTap: null, // لا شيء عند الضغط
                ),
                16.heightSpace(),
                // قسم: إعدادات التطبيق
                SectionTitle(
                    text: TranslationKeys.appSettings.translateValue()),
                SettingsItem(
                  title: TranslationKeys.changeLanguage.translateValue(),
                  subtitle: TranslationKeys.chooseAppLanguage.translateValue(),
                  icon: Icons.language,
                  trailingWidget: BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return DropdownButton<String>(
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        value: getIt<SharedPrefController>()
                            .getData(key: Keys.languageCode),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        items: AppRouter.supportedLanguages
                            .map((String languageCode) {
                          return DropdownMenuItem(
                            value: languageCode,
                            child: AppText(
                              text: context
                                  .read<SettingsCubit>()
                                  .getLanguageNameFromCode(languageCode),
                              fontSize: 16,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          log("Value is: $newValue");
                          context.read<SettingsCubit>().changeLanguage(context, Locale(newValue!));
                        },
                      );
                    },
                    buildWhen: (previous, current) => current is ChangeLanguage,
                  ),
                ),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    return SettingsItem(
                      title: TranslationKeys.changeTheme.translateValue(),
                      subtitle: TranslationKeys.darkMode.translateValue(),
                      icon: Icons.dark_mode,
                      trailingWidget: Switch(
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xff7B7D80),
                        activeTrackColor: const Color(0xffCECECE),
                        activeColor: Theme.of(context).primaryColor,
                        value: getIt<SharedPrefController>()
                                .getData(key: Keys.isDarkMode) ??
                            false,
                        onChanged: context.read<SettingsCubit>().toggleTheme,
                      ),
                    );
                  },
                  buildWhen: (previous, current) => current is ChangeTheme,
                ),

                16.heightSpace(),
                AppText(
                  text: TranslationKeys.support.translateValue(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SectionTitle(
                    text: TranslationKeys.supportAndHelp.translateValue()),
                SettingsItem(
                  title: TranslationKeys.helpCenter.translateValue(),
                  subtitle:
                      TranslationKeys.contactUsIfProblems.translateValue(),
                  icon: Icons.help_center,
                  onTap: () {
                    // فتح مركز المساعدة
                  },
                ),
                SettingsItem(
                  title: TranslationKeys.termsAndConditions.translateValue(),
                  subtitle: TranslationKeys.checkAppPolicy.translateValue(),
                  icon: Icons.policy,
                  onTap: () {
                    // عرض الشروط والأحكام
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: text,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
    );
  }
}

// نافذة وصف التطبيق
class AppDescriptionDialog extends StatelessWidget {
  const AppDescriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(TranslationKeys.descriptionTitle.translateValue()),
      content: Text(
        TranslationKeys.descriptionContent.translateValue(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(TranslationKeys.close.translateValue()),
        ),
      ],
    );
  }
}
