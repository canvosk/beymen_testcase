import 'package:beymen_testcase/constants/texts.dart';
import 'package:beymen_testcase/constants/theme/app_colors.dart';
import 'package:beymen_testcase/constants/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ShowPopups {
  
  static Future showpopup({
    required BuildContext context,
    required Icon titleIcon,
    required String content,
  }) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.bgColor,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            title: Center(child: titleIcon),
            content: Text(
              content,
              style: popupContentText(context),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColor.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppTexts.ok,
                  style: popupButtonText(context),
                ),
              ),
            ],
          );
        });
  }
}
