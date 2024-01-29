import 'package:beymen_testcase/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.bgColor,
    textTheme: GoogleFonts.robotoTextTheme(),
    floatingActionButtonTheme: floatingActionButtonThemeData,
  );
}

FloatingActionButtonThemeData floatingActionButtonThemeData =
    FloatingActionButtonThemeData(
  backgroundColor: AppColor.bgColor,
);
