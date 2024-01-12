import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';

Widget secondaryBtn(String title, VoidCallback onclick) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(200.w, 45.h),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12.r))),
      onPressed: onclick,
      child: Text(
        title,
        style: ApptextStyle.style15bold
            .copyWith(letterSpacing: 1, color: Appcolor.primarycolor),
      ));
}
