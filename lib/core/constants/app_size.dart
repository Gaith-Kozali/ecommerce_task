import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enum.dart';

class AppSize {
  double get bgHeaderFontSize => (24.sp).clamp(24, 32);
  double get mdHeaderFontSize => (21.sp).clamp(21, 24);
  double get bodyFontSize => (14.sp).clamp(14, 16);
  double get slBodyFontSize => (12.sp).clamp(12, 14);
  double get textFieldFontSize => (16.sp).clamp(16, 18);
  double get iconSmall => 16.r;
  double get iconMedium => 24.r;
  double get iconLarge => 32.r;
  double get iconXLarge => 40.r;
  double get appIcon => 80.r;
  double get textFieldWidth => min(450, 0.9.sw);
  double get dividerWidth => min(400, 0.85.sw);
}

class AppBreakpoints {
  static const mobile = 480;
  static const tablet = 600;
  static const desktop = 1024;

  static ScreenType getScreenType(double width) {
    if (width >= AppBreakpoints.desktop) {
      return ScreenType.desktop;
    } else if (width >= AppBreakpoints.tablet) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }

  static bool isMobile(double width) =>
      getScreenType(width) == ScreenType.mobile;

  static bool isTablet(double width) =>
      getScreenType(width) == ScreenType.tablet;

  static bool isDesktop(double width) =>
      getScreenType(width) == ScreenType.desktop;
}
