import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  double get bgHeaderFontSize => (24.sp).clamp(24, 32);
  double get bodyFontSize => (14.sp).clamp(14, 16);
  double get textFieldFontSize => (16.sp).clamp(16, 18);
  double get iconSmall => 16.r;
  double get iconMedium => 24.r;
  double get iconLarge => 32.r;
  double get appIcon => 80.r;
  double get textFieldWidth => min(450, 0.9.sw);
  double get dividerWidth => min(400,0.85.sw);

}
