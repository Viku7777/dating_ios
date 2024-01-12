import 'package:flutter/material.dart';
import 'package:dating/resource/const/color/colors.dart';

showLoading() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.black38,
    child: Center(
      child: CircularProgressIndicator(
        color: Appcolor.primarycolor,
      ),
    ),
  );
}
