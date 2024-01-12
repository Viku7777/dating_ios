import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/components/buttons/secondary_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/images/images.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/auth_view/sign_up/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            .1.sh.heightBox,
            Image.asset(
              ImageClass.logo,
              height: .35.sh,
              width: .45.sw,
            ),
            Text(
              "Sign up to continue",
              style: ApptextStyle.style18bold,
            ),
            const Spacer(),
            SizedBox(
                width: .8.sw, child: primaryBtn("Continue with email", () {})),
            10.h.heightBox,
            SizedBox(
                width: .8.sw,
                child: secondaryBtn("Use phone number", () {
                  Utils.nextscreen(context, const PhoneAuthView());
                })),
            20.h.heightBox,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already have an account? ",
                  style: ApptextStyle.style13Med.copyWith(color: Colors.black)),
              TextSpan(
                  text: "Sign In",
                  style: ApptextStyle.style13Med
                      .copyWith(color: Appcolor.primarycolor)),
            ])),
            .1.sh.heightBox,
          ],
        ),
      )),
    );
  }
}
