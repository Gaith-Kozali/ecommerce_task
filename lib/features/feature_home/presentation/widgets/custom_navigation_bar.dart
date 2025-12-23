import 'package:ecommerce_task/core/constants/app_spacing.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/controllers/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/assets_path.dart';
import '../../../../core/utils/screen_information.dart';
import '../../../feature_auth/domain/entities/user.dart';
import '../pages/cart_page.dart';
import '../pages/user_profile_page.dart';
import 'nav_button.dart';

class CustomNavigationBar extends StatelessWidget {
  final AppSize appSize;
  final User? user;
  const CustomNavigationBar({
    super.key,
    required this.appSize,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = getScreenWidth(context);
    return Container(
      width: screenWidth * (AppBreakpoints.isDesktop(screenWidth) ? 0.2 : 0.5),
      constraints: BoxConstraints(maxWidth: 250),
      height: getAvailableHeight(context),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(2, 0),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'E-Mart',
                style: TextStyle(
                  color: AppColor.secondaryText,
                  fontSize: appSize.mdHeaderFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.columnLarge,
              CircleAvatar(
                radius: appSize.iconLarge,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: SvgPicture.asset(
                  AssetsPath.userIcon,
                  width: appSize.iconMedium,
                  height: appSize.iconMedium,
                  color: AppColor.background,
                ),
              ),
              AppSpacing.columnSmall,
              Text(
                user?.userName ?? "",
                style: TextStyle(
                  color: AppColor.secondaryText,
                  fontWeight: FontWeight.w600,
                  fontSize: appSize.bodyFontSize,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              AppSpacing.columnXSmall,
              Text(
                user?.email ?? "",
                style: TextStyle(
                  color: AppColor.secondaryText,
                  fontSize: appSize.slBodyFontSize,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Column(
            children: [
              navButton(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                onPressed: () => context.push(CartPage.route),
              ),
              AppSpacing.columnMedium,
              navButton(
                icon: Icons.person_outline,
                label: 'Profile',
                onPressed:
                    () => context.push(UserProfilePage.route, extra: user),
              ),
              AppSpacing.columnMedium,
              navButton(
                icon: Icons.logout,
                label: 'Logout',
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                },
                iconColor: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
