import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';

Future<dynamic> titleContentOneButtonDialog({
  required BuildContext context,
  required String content,
  required String buttonText,
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h, bottom: 20.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          children: [
            SizedBox(
              width: 320.w,
              child: Text(
                content,
                style: customTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(260.w, 50.h),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
              ),
            ),
          ],
        );
      }),
    );
