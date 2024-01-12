import 'package:dating/resource/components/buttons/back_btn.dart';
import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/permision_view/contact_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:velocity_x/velocity_x.dart';

class InterestsView extends StatefulWidget {
  const InterestsView({super.key});

  @override
  State<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends State<InterestsView> {
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backBtn(context),
                TextButton(
                    onPressed: () {
                      Utils.nextscreen(context, const ContactPermissionView());
                    },
                    child: Text(
                      "Skip",
                      style: ApptextStyle.style16bold
                          .copyWith(color: Appcolor.primarycolor),
                    )),
              ],
            ),
            20.h.heightBox,
            Text(
              "Your interests",
              style: ApptextStyle.style11bold.copyWith(fontSize: 35.sp),
            ),
            .025.sh.heightBox,
            Text(
              "Select a few of your interests and let everyone \nknow what you’re passionate about.",
              style: ApptextStyle.style14Reg
                  .copyWith(color: Appcolor.greyLightColor),
            ),
            .05.sh.heightBox,
            Flexible(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.sp,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h),
                itemBuilder: (context, index) {
                  String select = data[index]["name"];

                  bool isSelected =
                      selected.any((element) => element == select);
                  return InkWell(
                    onTap: () {
                      if (isSelected) {
                        selected.removeWhere((element) => element == select);
                      } else {
                        selected.add(select);
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: isSelected
                              ? Appcolor.primarycolor
                              : Colors.transparent,
                          border: Border.all(
                              color: isSelected
                                  ? Appcolor.primarycolor
                                  : Appcolor.greyLightColor)),
                      child: Row(
                        children: [
                          10.w.widthBox,
                          Icon(
                            data[index]["icon"],
                            color: isSelected
                                ? Colors.white
                                : Appcolor.primarycolor,
                          ),
                          10.w.widthBox,
                          Text(
                            data[index]["name"],
                            style: ApptextStyle.style14bold.copyWith(
                                color:
                                    isSelected ? Colors.white : Colors.black),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
                width: double.infinity, child: primaryBtn("Continue", () {}))
          ],
        ),
      )),
    );
  }

  List data = [
    {
      "name": "Photography",
      "icon": Icons.camera_alt_outlined,
    },
    {
      "name": "Shopping",
      "icon": Icons.shopping_bag_outlined,
    },
    {
      "name": "Singing",
      "icon": Icons.mic,
    },
    {
      "name": "Yoga",
      "icon": Icons.ac_unit_sharp,
    },
    {
      "name": "Cooking",
      "icon": Icons.cookie_outlined,
    },
    {
      "name": "Cricket",
      "icon": Icons.circle,
    },
    {
      "name": "Run",
      "icon": Icons.run_circle_outlined,
    },
    {
      "name": "Swimming",
      "icon": Icons.water,
    },
    {
      "name": "Art",
      "icon": Icons.architecture,
    },
    {
      "name": "Traveling",
      "icon": Icons.card_travel_outlined,
    },
    {
      "name": "Music",
      "icon": Icons.music_note_outlined,
    },
    {
      "name": "Drink",
      "icon": Icons.local_drink_outlined,
    },
    {
      "name": "Video games",
      "icon": Icons.gamepad,
    },
    {
      "name": "Long Driving",
      "icon": Icons.pedal_bike_sharp,
    },
  ];
}
