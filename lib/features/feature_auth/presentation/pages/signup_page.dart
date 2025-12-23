import 'package:ecommerce_task/core/utils/screen_information.dart';
import 'package:ecommerce_task/core/utils/validation_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_progress_message.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_decoration.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/assets_path.dart';
import '../../../../core/utils/toggle_visibility_cubit.dart';
import '../controllers/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/link_button_widget.dart';

class SignupPage extends StatefulWidget {
  static const route = '/auth/sign-up';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController _userNameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;
  late ToggleVisibilityCubit _togglePassword;
  late AuthBloc _authBloc;
  String? _userName;
  String? _email;
  String? _password;
  final appSize = AppSize();
  @override
  void initState() {
    super.initState();
    _userNameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _togglePassword = ToggleVisibilityCubit();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  void signUpFun() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState?.save();
      _authBloc.add(
        SignUpEvent(userName: _userName!, email: _email!, password: _password!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = getScreenWidth(context);
    double height = getScreenHeight(context);
    return SafeArea(child: Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is SignUpProgress) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AssetsPath.appIcon,
                        width: appSize.appIcon,
                        height: appSize.appIcon,
                        fit: BoxFit.cover,
                      ),
                      AppSpacing.columnMedium,
                      Text(
                        "Create New Account",
                        style: TextStyle(fontSize: appSize.bgHeaderFontSize),
                      ),
                      SizedBox(height: height * 0.08),
                      Form(
                        key: globalKey,
                        child: Column(
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
                                  child: Text("Email"),
                                ),
                                AppSpacing.textFieldLabelSpacing,
                                SizedBox(
                                  width: appSize.textFieldWidth,
                                  height: 52.h,
                                  child: TextFormField(
                                    controller: _emailCtrl,
                                    decoration: AppDecoration.primary(
                                      prefixIcon: SvgPicture.asset(
                                        AssetsPath.emailIcon,
                                        width: appSize.iconMedium,
                                        height: appSize.iconMedium,
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) => _email = value,
                                    validator:
                                        (value) => Validation.email(value),
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
                                        (context, notVisible) => TextFormField(
                                      controller: _passwordCtrl,
                                      style: TextStyle(
                                        fontSize: appSize.textFieldFontSize,
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
                                      keyboardType:
                                      TextInputType.visiblePassword,
                                      onSaved: (value) => _password = value,
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
                              title: "Continue",
                              onTap: () => signUpFun(),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.columnExtraLarge,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is SignUpError) {
            AppProgressMessage.errorSnackMessage(context, state.failure.message);
          } else if (state is SignUpSuccess) {
            AppProgressMessage.successSnackMessage(context, "Create account success");
          }
        },
      ),
    ));
  }
}
