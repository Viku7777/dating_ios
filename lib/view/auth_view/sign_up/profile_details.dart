import 'package:dating/resource/components/buttons/primary_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/auth_view/sign_up/intrest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileDetailsView extends StatefulWidget {
  const ProfileDetailsView({super.key});

  @override
  State<ProfileDetailsView> createState() => _ProfileDetailsViewState();
}

class _ProfileDetailsViewState extends State<ProfileDetailsView> {
  var nameNode = FocusNode();
  String gender = "Male";
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
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    Utils.nextscreen(context, const InterestsView());
                  },
                  child: Text(
                    "Skip",
                    style: ApptextStyle.style16bold
                        .copyWith(color: Appcolor.primarycolor),
                  )),
            ),
            Text(
              "Profile details",
              style: ApptextStyle.style11bold.copyWith(fontSize: 35.sp),
            ),
            .025.sh.heightBox,
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                      height: 100.h,
                      width: 100.w,
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            dummyImage,
                            fit: BoxFit.cover,
                          ))),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolor.primarycolor),
                        child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20.sp,
                            )),
                      ))
                ],
              ),
            ),
            10.h.heightBox,
            TextField(
              focusNode: nameNode,
              cursorColor: Appcolor.primarycolor,
              decoration: InputDecoration(
                labelText: "Your Name",
                labelStyle:
                    ApptextStyle.style14Reg.copyWith(color: Colors.black54),
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
              "I am a",
              style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
            ),
            10.h.heightBox,
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
                  tileColor:
                      isSelected ? Appcolor.primarycolor : Colors.transparent,
                  title: Text(
                    e,
                    style: ApptextStyle.style16bold.copyWith(
                        color: isSelected ? Colors.white : Colors.black87,
                        letterSpacing: 1),
                  ),
                  trailing: Icon(
                    Icons.check,
                    color: isSelected ? Colors.white : Colors.grey.shade500,
                  ),
                ),
              );
            }).toList(),
            10.h.heightBox,
            ListTile(
              onTap: () => showCalander(),
              tileColor: Appcolor.primarycolor.withOpacity(.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              leading: Icon(
                Icons.calendar_month,
                color: Appcolor.primarycolor,
              ),
              title: Text(
                "Choose birthday date",
                style: ApptextStyle.style15bold
                    .copyWith(color: Appcolor.primarycolor),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity, child: primaryBtn("Confirm", () {})),
            5.h.heightBox,
          ],
        ),
      )),
    );
  }

  showCalander() {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      constraints: BoxConstraints(maxHeight: .6.sh, minWidth: .1.sw),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: TableCalendar(
            availableCalendarFormats: availableCalendarFormats,
            firstDay: DateTime.utc(1979, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                    color: Appcolor.primarycolor, shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    color: Appcolor.primarycolor, shape: BoxShape.circle),
                weekendTextStyle: const TextStyle(color: Colors.white),
                todayTextStyle: const TextStyle(color: Colors.white),
                holidayTextStyle: const TextStyle(color: Colors.white),
                withinRangeTextStyle: const TextStyle(color: Colors.white),
                defaultTextStyle: const TextStyle(color: Colors.white)),
            daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white)),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white),
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  Map<CalendarFormat, String> availableCalendarFormats = const {
    CalendarFormat.month: 'Month',
    CalendarFormat.week: 'Week'
  };
}

String dummyImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLMr0HZTQI2cK-Fo6_ood-9-8jAg84m9aGT3mLDP5fL80X83XYEZVD01Ilr9vfY8AdvRg&usqp=CAU";
