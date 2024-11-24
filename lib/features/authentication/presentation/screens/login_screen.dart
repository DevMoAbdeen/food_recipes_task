import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/extensions/screen_size_extensions.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/extensions/snack_bar_extension.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widget/app_button.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/app_widget/app_text_field.dart';
import '../../../../core/app_widget/loading_overlay_widget.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/routing/router_list.dart';
import '../controller/cubits/login_cubit.dart';
import '../controller/states/login_states.dart';
import '../widgets/login_rich_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {
          if (state is LoginSuccess) {
            context.showSnackBar(message: TranslationKeys.loggedIn.translateValue(), type: SnackBarType.success);
            context.pushNamedAndRemoveAll(RouterList.mainScreen);
          }
          if (state is LoginError) {
            context.showSnackBar(message: state.message, type: SnackBarType.error);
          }
        },
        builder: (BuildContext context, LoginStates state) {
          var loginCubit = context.read<LoginCubit>();

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    height: context.screenHeight(),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: loginCubit.formKey,
                        child: AutofillGroup(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                AppImages.login,
                                height: context.screenHeight() * 0.4,
                                width: context.screenWidth(),
                              ),
                              16.heightSpace(),
                              AppTextField(
                                keyboardType: TextInputType.name,
                                autofillHints: AutofillHints.username,
                                labelText: TranslationKeys.username.translateValue(),
                                prefixIcon: const Icon(Icons.account_circle),
                                onChanged: (value) => loginCubit.userNameText = value,
                                validator: (String? value) {
                                  if (value!.toString().isEmpty) {
                                    return TranslationKeys.emptyUsername.translateValue();
                                  }
                                  return null;
                                },
                              ),
                              16.heightSpace(),
                              BlocBuilder<LoginCubit, LoginStates>(
                                builder: (context, state) {
                                  var cubit = context.read<LoginCubit>();
                                  return AppTextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    autofillHints: AutofillHints.password,
                                    obscureText: !cubit.isVisible,
                                    labelText: TranslationKeys.password.translateValue(),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: Icon(cubit.isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    ),
                                    onClickSuffix: () => cubit.changePasswordVisibility(),
                                    onChanged: (value) => loginCubit.passwordText = value,
                                    validator: (String? value) {
                                      if (value!.toString().length < 6) {
                                        return TranslationKeys.shortPassword.translateValue();
                                      }
                                      return null;
                                    },
                                  );
                                },
                                buildWhen: (previous, current) => current is LoginChangePasswordVisibility,
                              ),
                              16.heightSpace(),
                              InkWell(
                                onTap: () => {},
                                child: AppText(
                                  text: TranslationKeys.forgetPassword.translateValue(),
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              20.heightSpace(),
                              AppButton(
                                text: TranslationKeys.login.translateValue(),
                                onPressed: () => loginCubit.login(),
                              ),
                              16.heightSpace(),
                              LoginRichText(
                                firstText: TranslationKeys.notHaveAccount.translateValue(),
                                secondText: TranslationKeys.createNewAccount.translateValue(),
                                onTapSecondText: () => {},
                              ),
                              32.heightSpace(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  LoadingOverlayWidget(isVisible: state is LoginLoading),
                ],
              ),
            ),
          );
        },
        listenWhen: (previous, current) =>
            current is LoginSuccess || current is LoginError,
        buildWhen: (previous, current) =>
            current is LoginLoading ||
            current is LoginSuccess ||
            current is LoginError,
      ),
    );
  }
}
