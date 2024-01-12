import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String gender = "Male";
  var nameNode = FocusNode();
  List<String> selected = [];

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

  List<String> genderList = ["Female", "Male", "Other"];
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
                Text(
                  "Profile",
                  style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
                ),
                SizedBox(width: 100.w, child: primaryBtn("Save", () {}))
              ],
            ),
            20.h.heightBox,
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    cursorColor: Appcolor.primarycolor,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: ApptextStyle.style14Reg
                          .copyWith(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: Colors.black54)),
                    ),
                  ),
                  20.h.heightBox,
                  TextField(
                    cursorColor: Appcolor.primarycolor,
                    decoration: InputDecoration(
                      labelText: "title",
                      labelStyle: ApptextStyle.style14Reg
                          .copyWith(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: Colors.black54)),
                    ),
                  ),
                  20.h.heightBox,
                  TextField(
                    // focusNode: nameNode,
                    cursorColor: Appcolor.primarycolor,
                    minLines: 5,
                    maxLines: 100,
                    decoration: InputDecoration(
                      hintText: "About",
                      labelStyle: ApptextStyle.style14Reg
                          .copyWith(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: const BorderSide(color: Colors.black54)),
                    ),
                  ),
                  20.h.heightBox,
                  Text(
                    "My Pictures",
                    style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
                  ),
                  20.h.heightBox,
                  Wrap(
                      children: List.generate(
                    5,
                    (index) => Container(
                      height: 80.h,
                      width: 85.w,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Appcolor.primarycolor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                  )),
                  20.h.heightBox,
                  Text(
                    "I am a",
                    style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
                  ),
                  20.h.heightBox,
                  ...genderList.map((e) {
                    bool isSelected = e == gender;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            gender = e;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: isSelected
                                    ? Appcolor.primarycolor
                                    : Appcolor.greyLightColor),
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: isSelected
                            ? Appcolor.primarycolor
                            : Colors.transparent,
                        title: Text(
                          e,
                          style: ApptextStyle.style16bold.copyWith(
                              color: isSelected ? Colors.white : Colors.black87,
                              letterSpacing: 1),
                        ),
                        trailing: Icon(
                          Icons.check,
                          color:
                              isSelected ? Colors.white : Colors.grey.shade500,
                        ),
                      ),
                    );
                  }).toList(),
                  20.h.heightBox,
                  Text(
                    "My interests",
                    style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
                  ),
                  20.h.heightBox,
                  SizedBox(
                    height: .6.sh,
                    child: GridView.builder(
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
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
                              selected
                                  .removeWhere((element) => element == select);
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
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.h.heightBox,
                  primaryBtn("Logout", () {}),
                  50.h.heightBox,
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
