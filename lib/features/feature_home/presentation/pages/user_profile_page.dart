import 'package:ecommerce_task/core/app_progress_message.dart';
import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/controllers/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_decoration.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../feature_auth/domain/entities/user.dart';

class UserProfilePage extends StatelessWidget {
  static const route = '/home/user-profile';
  final User? user;

  const UserProfilePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    AppSize appSize = AppSize();
    return BlocConsumer<AuthBloc,AuthState>(builder: (context, state) {
      if(state is! FetchUserInfError && user !=null){
        return  SafeArea(child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.secondaryText,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: AppSpacing.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _ProfileHeader(user: user!, appSize: appSize),
                AppSpacing.columnLarge,

                _ProfileCard(
                  title: 'Account Information',
                  appSize: appSize,
                  children: [
                    _ProfileField(
                      label: 'Username',
                      value: user?.userName,
                      appSize: appSize,
                    ),
                    _ProfileField(
                      label: 'Email',
                      value: user?.email,
                      appSize: appSize,
                    ),
                    _ProfileField(
                      label: 'Phone',
                      value: user?.phone,
                      appSize: appSize,
                    ),
                  ],
                ),

                AppSpacing.columnLarge,
                _ProfileCard(
                  title: 'Personal Information',
                  appSize: appSize,
                  children: [
                    _ProfileField(
                      label: 'First Name',
                      value: user?.firstName,
                      appSize: appSize,
                    ),
                    _ProfileField(
                      label: 'Last Name',
                      value: user?.lastName,
                      appSize: appSize,
                    ),
                  ],
                ),

                if (user?.address != null) ...[
                  AppSpacing.columnLarge,
                  _ProfileCard(
                    title: 'Address',
                    appSize: appSize,
                    children: [
                      _ProfileField(
                        label: 'City',
                        value: user?.address!.city,
                        appSize: appSize,
                      ),
                      _ProfileField(
                        label: 'Street',
                        value: user?.address!.street,
                        appSize: appSize,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ));
      }
      return SizedBox();
    }, listener: (BuildContext context, AuthState state) {
      if(user==null){
        AppProgressMessage.errorMessage(context, message: "Error");
      }
    },);
  }
}

class _ProfileHeader extends StatelessWidget {
  final User user;
  final AppSize appSize;
  const _ProfileHeader({required this.user, required this.appSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 42.r,
            backgroundColor: AppColor.secondary,
            child: Text(
              user.userName[0].toUpperCase(),
              style: TextStyle(
                fontSize: appSize.mdHeaderFontSize,
                color: AppColor.secondaryText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AppSpacing.columnMedium,
          Text(
            user.userName,
            style: TextStyle(
              fontSize: appSize.bodyFontSize,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryText,
            ),
          ),
          AppSpacing.columnSmall,
          Text(
            user.email,
            style: TextStyle(
              fontSize: appSize.slBodyFontSize,
              color: AppColor.primaryText.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final AppSize appSize;
  const _ProfileCard({
    required this.title,
    required this.children,
    required this.appSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.allMedium,
      decoration: BoxDecoration(
        color: AppColor.authCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: appSize.mdHeaderFontSize,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryText,
            ),
          ),
          AppSpacing.columnMedium,
          ...children,
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String? value;
  final AppSize appSize;

  const _ProfileField({
    required this.label,
    required this.value,
    required this.appSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.verticalSmall,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: appSize.slBodyFontSize,
              color: AppColor.primaryText.withOpacity(0.6),
            ),
          ),
          AppSpacing.columnXSmall,
          SizedBox(width: appSize.textFieldWidth,child: TextFormField(
            initialValue: value ?? '-',
            readOnly: true,
            decoration: AppDecoration.primary(),
            style: TextStyle(
              fontSize: appSize.bodyFontSize,
              color: AppColor.primaryText,
            ),
          ),),
        ],
      ),
    );
  }
}
