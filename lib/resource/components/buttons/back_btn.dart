import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating/resource/const/color/colors.dart';

Widget backBtn(
  BuildContext context, {
  Function()? onTap,
  IconData icon = Icons.arrow_back_ios_new_rounded,
}) {
  return InkWell(
    onTap: onTap ?? () => Navigator.pop(context),
    child: Container(
      height: 40.h,
      width: 45.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300)),
      child: Icon(
        icon,
        color: Appcolor.primarycolor,
        size: 18.sp,
      ),
    ),
  );
}
