import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/images/images.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/home/nav_bar/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationPermissionView extends StatelessWidget {
  const NotificationPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    Utils.nextscreen(context, const NavBarViewScreen());
                  },
                  child: Text(
                    "Skip",
                    style: ApptextStyle.style16bold
                        .copyWith(color: Appcolor.primarycolor),
                  )),
            ),
            .1.sh.heightBox,
            Image.asset(
              ImageClass.notificationpermission,
              height: .3.sh,
              width: .75.sw,
            ),
            .1.sh.heightBox,
            Text(
              "Enable notification’s",
              style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
            ),
            10.h.heightBox,
            Text(
              "Get push-notification when you get the match \nor receive a message.",
              style: ApptextStyle.style15Med
                  .copyWith(color: Appcolor.greyLightColor),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: primaryBtn("I want to be notified", () {}),
            ),
            20.h.heightBox,
          ],
        ),
      )),
    );
  }
}
