import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:dating/data/network/network.dart';
import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/components/process/process_screen.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view_model/controller/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({super.key});

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  var focus = FocusNode();
  var number = TextEditingController();
  var controller = Get.put(AuthControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: .1.sw),
                    child: SafeArea(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        .1.sh.heightBox,
                        Text(
                          "My mobile",
                          style: ApptextStyle.style11bold
                              .copyWith(fontSize: 35.sp),
                        ),
                        10.h.heightBox,
                        Text(
                          "Please enter your valid phone number. \nWe will send you a 6-digit code to verify your account.",
                          style: ApptextStyle.style14Reg
                              .copyWith(color: Colors.grey.shade700),
                        ),
                        .075.sh.heightBox,
                        Container(
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Colors.grey.shade400)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "+91",
                                    textAlign: TextAlign.center,
                                    style: ApptextStyle.style14Med,
                                  )),
                              VerticalDivider(
                                thickness: 2,
                                indent: 15.h,
                                endIndent: 15.h,
                              ),
                              Expanded(
                                  flex: 5,
                                  child: TextField(
                                    controller: number,
                                    focusNode: focus,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: Appcolor.primarycolor,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        letterSpacing: .5,
                                        color: Colors.grey.shade700),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10.w),
                                      border: InputBorder.none,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        .075.sh.heightBox,
                        SizedBox(
                            width: .8.sw,
                            child: primaryBtn("Continue", () async {
                              focus.unfocus();
                              if (number.text.length != 10) {
                                Utils.flushBarSuccess(
                                    "Please enter a vaild mobile number",
                                    context);
                              } else {
                                NetworkBaseApis.fQureyFind(FirebaseFirestore
                                        .instance
                                        .collection("users")
                                        .where("number",
                                            isEqualTo: number.text))
                                    .then((value) {
                                  print(value);
                                }).onError((error, stackTrace) {
                                  print(error);
                                });
                                // NetworkBaseApis.fQureyData(collection)
                                // controller.sendOTP(number.text, context);
                              }
                            }))
                      ],
                    )))),
            GetBuilder<AuthControllers>(
              builder: (controller) {
                return controller.loading ? showLoading() : const SizedBox();
              },
            )
          ],
        ));
  }
}
