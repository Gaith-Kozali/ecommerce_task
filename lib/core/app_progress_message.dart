import 'package:ecommerce_task/core/constants/app_color.dart';
import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:ecommerce_task/core/constants/app_spacing.dart';
import 'package:ecommerce_task/core/constants/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AppProgressMessage {
  static final primaryProgress = Center(
    child: Lottie.asset('assets/progress.json', width: 200.r, height: 200.r),
  );
  static errorSnackMessage(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColor.error,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
              size: AppSize().iconMedium,
            ),
            AppSpacing.rowMedium,
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSize().slBodyFontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static successSnackMessage(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColor.success,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: AppSize().iconMedium,
            ),
            AppSpacing.rowMedium,
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSize().slBodyFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> errorMessage(
    BuildContext context, {
    required String message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Dialog(
              backgroundColor: AppColor.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: AppSpacing.allLarge,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      AssetsPath.errorIconMessage,
                      width: 120.r,
                      height: 120.r,
                      fit: BoxFit.contain,
                    ),
                    AppSpacing.columnMedium,
                    Text(
                      "Oops!",
                      style: TextStyle(
                        fontSize: AppSize().mdHeaderFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColor.error,
                      ),
                    ),
                    AppSpacing.columnSmall,
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppSize().bodyFontSize,
                        color: AppColor.primaryText.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
