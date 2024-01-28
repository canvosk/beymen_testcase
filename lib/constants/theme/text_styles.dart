import 'package:beymen_testcase/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle? serialNumberText(BuildContext context) =>
    Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColor.textColor.withOpacity(0.8),
          fontStyle: FontStyle.italic,
        );

TextStyle? productNameText(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppColor.textColor,
        );

TextStyle? popupContentText(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColor.textColor,
        );

TextStyle? popupButtonText(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppColor.black,
        );
