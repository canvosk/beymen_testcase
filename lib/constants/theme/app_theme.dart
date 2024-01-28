import 'package:beymen_testcase/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.bgColor,
    textTheme: GoogleFonts.robotoTextTheme(),
    floatingActionButtonTheme: floatingActionButtonThemeData,
    // appBarTheme: appBarTheme(),
  );
}

FloatingActionButtonThemeData floatingActionButtonThemeData =
    FloatingActionButtonThemeData(
  backgroundColor: AppColor.bgColor,
);

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // Navigation bar
      statusBarColor: Colors.pink, // Status bar
    ),
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}
