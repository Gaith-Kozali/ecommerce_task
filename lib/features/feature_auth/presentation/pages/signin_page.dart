import 'dart:ui';

import 'package:ecommerce_task/core/app_progress_message.dart';
import 'package:ecommerce_task/core/constants/app_color.dart';
import 'package:ecommerce_task/core/constants/app_decoration.dart';
import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:ecommerce_task/core/constants/app_spacing.dart';
import 'package:ecommerce_task/core/constants/assets_path.dart';
import 'package:ecommerce_task/core/utils/screen_information.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/controllers/auth_bloc.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/pages/signup_page.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/toggle_visibility_cubit.dart';
import '../../../../core/utils/validation_func.dart';
import '../widgets/auth_button.dart';
import '../widgets/link_button_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const route = '/auth/sign-in';
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController _userNameCtrl;
  late TextEditingController _passwordCtrl;
  late ToggleVisibilityCubit _togglePassword;
  String? _userName;
  String? _password;
  late AuthBloc _authBloc;
  final appSize = AppSize();
  @override
  void initState() {
    super.initState();
    _userNameCtrl = TextEditingController(text: "johnd");
    _passwordCtrl = TextEditingController(text: r"m38rmF$");
    _togglePassword = ToggleVisibilityCubit();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  void signInFun() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState?.save();
      TextInput.finishAutofillContext();
      _authBloc.add(SignInEvent(userName: _userName!, password: _password!));

    }
  }

  @override
  Widget build(BuildContext context) {
    double width = getScreenWidth(context);
    double height = getScreenHeight(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is SignInProgress) {
              return Center(child: AppProgressMessage.primaryProgress);
            }
            return SingleChildScrollView(
              padding: AppSpacing.pagePadding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (height - AppSpacing.pagePadding.vertical),
                ),
                child: Center(
                  child: Container(
                    decoration:
                        !AppBreakpoints.isMobile(width)
                            ? BoxDecoration(
                              color: AppColor.authCard,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 3,
                                color: AppColor.textField,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.shadow,
                                  blurRadius: 20,
                                  offset: const Offset(8, 8),
                                ),
                              ],
                            )
                            : null,
                    padding:
                        !AppBreakpoints.isMobile(width)
                            ? AppSpacing.cardAuthPadding
                            : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AssetsPath.appIcon,
                          width: appSize.appIcon,
                          height: appSize.appIcon,
                          fit: BoxFit.cover,
                        ),
                        AppSpacing.columnMedium,
                        RichText(
                          text: TextSpan(
                            text: "Welcome to ",
                            style: TextStyle(
                              fontSize: appSize.bgHeaderFontSize,
                              color: AppColor.primaryText,
                            ),
                            children: [
                              TextSpan(
                                text: "E-Mart",
                                style: TextStyle(color: AppColor.primary),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.08),
                        Form(
                          key: globalKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: Text("User name"),
                                  ),
                                  AppSpacing.textFieldLabelSpacing,
                                  SizedBox(
                                    width: appSize.textFieldWidth,
                                    height: 52.h,
                                    child: TextFormField(
                                      controller: _userNameCtrl,
                                      decoration: AppDecoration.primary(
                                        prefixIcon: SvgPicture.asset(
                                          AssetsPath.userIcon,
                                          width: appSize.iconMedium,
                                          height: appSize.iconMedium,
                                        ),
                                      ),
                                      autofillHints: [AutofillHints.username],
                                      keyboardType: TextInputType.name,
                                      onSaved: (value) => _userName = value,
                                      validator:
                                          (value) => Validation.notEmpty(value),
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.formFieldSpacing,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: Text("Password"),
                                  ),
                                  AppSpacing.textFieldLabelSpacing,
                                  SizedBox(
                                    width: appSize.textFieldWidth,
                                    height: 52.h,
                                    child: BlocBuilder<
                                      ToggleVisibilityCubit,
                                      bool
                                    >(
                                      bloc: _togglePassword,
                                      builder:
                                          (
                                            context,
                                            notVisible,
                                          ) => TextFormField(
                                            controller: _passwordCtrl,
                                            style: TextStyle(
                                              fontSize:
                                                  appSize.textFieldFontSize,
                                            ),
                                            obscureText: notVisible,
                                            decoration: AppDecoration.primary(
                                              prefixIcon: SvgPicture.asset(
                                                AssetsPath.passwordIcon,
                                                width: appSize.iconMedium,
                                                height: appSize.iconMedium,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed:
                                                    () =>
                                                        _togglePassword
                                                            .changeVisibleState(),
                                                icon: Icon(
                                                  notVisible
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  size: appSize.iconMedium,
                                                ),
                                              ),
                                            ),
                                            autofillHints: [
                                              AutofillHints.password,
                                            ],
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            onSaved:
                                                (value) => _password = value,
                                            validator:
                                                (value) =>
                                                    Validation.notEmpty(value),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.columnXXLarge,
                              AuthButton(
                                title: "SignIn",
                                onTap: () => signInFun(),
                              ),
                            ],
                          ),
                        ),
                        AppSpacing.columnExtraLarge,
                        SizedBox(width: appSize.dividerWidth, child: Divider()),
                        AppSpacing.columnSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Don’t have an account ?"),
                            AppSpacing.rowSmall,
                            LinkButtonWidget(
                              text: "SignUp",
                              onTap: () {
                                context.push(SignupPage.route);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is SignInError) {
              AppProgressMessage.errorSnackMessage(
                context,
                state.failure.message,
              );
            } else if (state is SignInSuccess) {
              context.go(HomePage.route);
            }
          },
        ),
      ),
    );
  }
}
