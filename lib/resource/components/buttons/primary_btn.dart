import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';

Widget primaryBtn(String title, VoidCallback onclick) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.primarycolor,
          minimumSize: Size(200.w, 45.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r))),
      onPressed: onclick,
      child: Text(
        title,
        style: ApptextStyle.style15bold.copyWith(letterSpacing: 1),
      ));
}
