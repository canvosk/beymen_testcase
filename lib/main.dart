import 'dart:io';

import 'package:beymen_testcase/app/products_page/products_page.dart';
import 'package:beymen_testcase/constants/texts.dart';
import 'package:beymen_testcase/constants/theme/app_theme.dart';
import 'package:beymen_testcase/core/helpers/http_overrides.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.appTitle,
      theme: theme(),
      home: const ProductsPage(),
    );
  }
}
