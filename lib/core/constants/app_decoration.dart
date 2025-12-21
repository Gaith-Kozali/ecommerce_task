import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppDecoration {
  static InputDecoration primary({Widget? prefixIcon, Widget? suffixIcon}) {
    return InputDecoration(
      fillColor: AppColor.textField,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.secondary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      errorStyle: const TextStyle(fontSize: 0),
      prefixIcon: Center(widthFactor: 0, child: prefixIcon),
      suffixIcon: suffixIcon,
    );
  }
}
