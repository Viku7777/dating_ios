import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dating/resource/components/buttons/back_btn.dart';
import 'package:dating/resource/components/process/process_screen.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/auth_view/sign_up/phone_auth.dart';
import 'package:dating/view_model/controller/auth_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

class EnterOtpView extends StatefulWidget {
  final String number;
  const EnterOtpView({super.key, required this.number});

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  var authcontroller = Get.put(AuthControllers());
  TextEditingController controller = TextEditingController();
  bool ischange = false;
  int leftTime = 0;
  late Timer timer;

  @override
  void initState() {
    timerFun();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int calculateTime = 60 - leftTime;
    String time =
        calculateTime < 10 ? "00:0$calculateTime" : "00:$calculateTime";

    return Scaffold(
        body: Stack(children: [
      SafeArea(
          child: SizedBox(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20.w),
              child: backBtn(
                context,
              ),
            ),
            .075.sh.heightBox,
            Text(
              time,
              style: ApptextStyle.style11bold.copyWith(fontSize: 35.sp),
            ),
            15.h.heightBox,
            Text(
              "Type the verification code \nwe’ve sent you",
              style:
                  ApptextStyle.style18Med.copyWith(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            15.h.heightBox,
            SizedBox(
                height: .1.sh,
                child: Pinput(
                    length: 6,
                    onChanged: (value) {
                      if (value.length == 6) {
                        // authcontroller.updateLoading();
                      }
                    },
                    readOnly: true,
                    showCursor: false,
                    controller: controller,
                    defaultPinTheme: PinTheme(
                        width: 45.w,
                        height: 45.h,
                        constraints:
                            BoxConstraints(minHeight: 45.h, minWidth: 45.w),
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: const Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolor.primarycolor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )))),
            10.h.heightBox,
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.5.sp),
                itemBuilder: (context, index) {
                  if (index < 9) {
                    return TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                                Colors.pink.withOpacity(.04))),
                        onPressed: () {
                          if (controller.text.length < 6) {
                            controller.text = "${controller.text}${index + 1}";
                            setState(() {});
                          }
                        },
                        child: Text(
                          "${index + 1}",
                          style: ApptextStyle.style24Med
                              .copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ));
                  } else {
                    if (index == 9) {
                      return const SizedBox();
                    } else if (index == 10) {
                      return TextButton(
                          onPressed: () {
                            if (controller.text.length < 6) {
                              controller.text = "${controller.text}0";
                              setState(() {});
                            }
                          },
                          style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  Colors.pink.withOpacity(.04))),
                          child: Text(
                            "0",
                            style: ApptextStyle.style24Med
                                .copyWith(color: Colors.black),
                            textAlign: TextAlign.center,
                          ));
                    } else {
                      return IconButton(
                          onPressed: () {
                            if (controller.text.isNotEmpty) {
                              List<String> c = controller.text.split("");
                              c.removeLast();
                              controller.text = c.join("");
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.cancel_rounded));
                    }
                  }
                },
              ),
            ),
            InkWell(
              onTap: () async {
                await authcontroller.sendOTP(widget.number, context,
                    isResendOTP: true);
                timer.cancel();
                timerFun();
              },
              // Utils.nextscreen(context, const ProfileDetailsView()),
              child: Text(
                "Send again",
                style: ApptextStyle.style16bold
                    .copyWith(color: Appcolor.primarycolor),
              ),
            ),
            .05.sh.heightBox,
          ],
        ),
      )),
      GetBuilder<AuthControllers>(
        builder: (controller) {
          return controller.loading ? showLoading() : const SizedBox();
        },
      )
    ]));
  }

  timerFun() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      leftTime = timer.tick;
      if (timer.tick == 60) {
        Utils.nextScreenWithRemove(context, const PhoneAuthView());
        Utils.flushBarSuccess("Verification failed", context);
      }
      setState(() {});
    });
  }
}
