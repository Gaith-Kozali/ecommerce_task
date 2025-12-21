import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      surface: AppColor.background,
    ),
    textTheme: GoogleFonts.robotoTextTheme(
      TextTheme(bodySmall: TextStyle(fontSize: 14)),
    ),
  );
}
