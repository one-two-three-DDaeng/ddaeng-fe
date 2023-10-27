import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';

ThemeData customTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'NotoSans',
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColor.mainColor,
      centerTitle: true,
      toolbarHeight: 56.h,
      iconTheme: IconThemeData(
        color: CustomColor.blackColor,
        size: 26.w,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.mainColor,
        fixedSize: Size.fromHeight(54.h),
        padding: EdgeInsets.only(
          left: 6.w,
          right: 6.w,
        ),
        textStyle: customTextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size.fromHeight(40.h),
        padding: EdgeInsets.zero,
        side: BorderSide(
          width: 1.w,
          color: CustomColor.mainColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.w),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColor.mainColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: CustomColor.lineColor,
  );
}
