// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/images/images.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/auth_view/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int pageindex = 0;

  List<String> onboardingImage = [
    ImageClass.onboardingImg1,
    ImageClass.onboardingImg2,
    ImageClass.onboardingImg3,
  ];

  List onboardingData = [
    {
      "title": "Matches",
      "sub":
          "We match you with people that have a \nlarge array of similar interests.",
    },
    {
      "title": "Algorithm",
      "sub":
          "Users going through a vetting process to \nensure you never match with bots.",
      "img": ImageClass.onboardingImg1,
    },
    {
      "title": "Premium",
      "sub":
          "Sign up today and enjoy the first month \nof premium benefits on us.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          10.h.heightBox,
          CarouselSlider(
              options: CarouselOptions(
                  height: 400.h,
                  animateToClosest: true,
                  viewportFraction: .7,
                  onPageChanged: (index, reason) {
                    setState(() {});
                    pageindex = index;
                  },
                  enlargeCenterPage: true),
              items: onboardingImage.map((e) => Image.asset(e)).toList()),
          Text(onboardingData[pageindex]["title"],
              style: ApptextStyle.style25bold
                  .copyWith(color: const Color(0xffE94057))),
          5.h.heightBox,
          Text(
            onboardingData[pageindex]["sub"],
            textAlign: TextAlign.center,
            style: ApptextStyle.style15Med,
          ),
          Expanded(
            child: PageViewDotIndicator(
              currentItem: pageindex,
              count: 3,
              size: const Size(10, 10),
              unselectedSize: const Size(8, 8),
              unselectedColor: Colors.grey.shade300,
              selectedColor: Appcolor.primarycolor,
            ),
          ),
          SizedBox(
            width: .8.sw,
            child: primaryBtn("Create an account", () {
              Utils.nextScreenWithRemove(context, const SignUpView());
            }),
          ),
          10.h.heightBox,
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
          10.h.heightBox,
        ],
      )),
    );
  }
}
