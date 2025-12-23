import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  static Widget get textFieldLabelSpacing => SizedBox(height: 8.h);

  static Widget get formFieldSpacing => SizedBox(height: 16.h);
  static Widget get columnXSmall => SizedBox(height: 4.h);
  static Widget get columnSmall => SizedBox(height: 8.h);
  static Widget get columnMedium => SizedBox(height: 16.h);
  static Widget get columnLarge => SizedBox(height: 24.h);
  static Widget get columnExtraLarge => SizedBox(height: 32.h);
  static Widget get columnXXLarge => SizedBox(height: 40.h);

  /// >>>>>>>>>>>>>>> Row space
  static Widget get rowSmall => SizedBox(width: 8.w);
  static Widget get rowMedium => SizedBox(width: 16.w);
  static Widget get rowLarge => SizedBox(width: 24.w);

  /// >>>>>>>>>>>>>>> Padding

  static EdgeInsets get allSmall => EdgeInsets.all(8.r);
  static EdgeInsets get allMedium => EdgeInsets.all(16.r);
  static EdgeInsets get allLarge => EdgeInsets.all(24.r);

  static EdgeInsets get horizontalSmall =>
      EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get horizontalMedium =>
      EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get horizontalLarge =>
      EdgeInsets.symmetric(horizontal: 24.w);

  static EdgeInsets get verticalSmall => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get verticalMedium => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get verticalLarge => EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets get pagePadding =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h);
  static EdgeInsets get navigationBarPadding =>
      EdgeInsets.symmetric(horizontal: 8, vertical: 32.h);

  static EdgeInsets get cardAuthPadding => EdgeInsets.symmetric(
    vertical: 16.h,
    horizontal: 8.w,
  ).copyWith(bottom: 40.h);
}
