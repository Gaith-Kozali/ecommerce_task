import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppProgressMessage {
  static final primaryProgress = Center(
    child: Lottie.asset('assets/progress.json', width: 200.r, height: 200.r),
  );
  static errorMessage() {}
}
