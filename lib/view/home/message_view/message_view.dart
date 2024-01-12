import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/view/auth_view/sign_up/profile_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.primarycolor,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        flexibleSpace: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.w.widthBox,
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            dummyImage,
                            height: 45.h,
                            width: 45.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 12.w,
                            width: 12.w,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    10.w.widthBox,
                    Text(
                      "Vikrant",
                      style: ApptextStyle.style20bold,
                    ),
                  ],
                ),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Appcolor.primarycolor,
                  decoration: InputDecoration(
                      hintText: "Your message",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(20.sp)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(20.sp))),
                ),
              ),
              20.w.widthBox,
              Container(
                height: 50.h,
                width: 55.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey.shade400)),
                child: Icon(
                  Icons.send,
                  color: Appcolor.primarycolor,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showMessageTile(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: .9.sh,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: Column(
          children: [
            10.h.heightBox,
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.w.widthBox,
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  Stack(
                    children: [
                      Container(
                        height: 40.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(dummyImage))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 12.w,
                          width: 12.w,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                  10.w.widthBox,
                  Text(
                    "Vikrant",
                    style: ApptextStyle.style20bold,
                  ),
                ],
              ),
            ),
            const Divider(
              color: CupertinoColors.systemGrey,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index]["sendby"] == "me"
                    ? Padding(
                        padding: EdgeInsets.only(right: .2.sw, left: .02.sw),
                        child: Container(
                          margin: EdgeInsets.all(10.sp),
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Appcolor.primarycolor.withOpacity(.15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messages[index]["message"],
                                style: ApptextStyle.style15Med,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("03:43 PM"),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: .2.sw, right: .02.sw),
                        child: Container(
                          margin: EdgeInsets.all(10.sp),
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Appcolor.greyLightColor.withOpacity(.35)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messages[index]["message"],
                                style: ApptextStyle.style15Med,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text("03:43 PM"),
                                  Icon(
                                    Icons.check_box,
                                    color: Appcolor.primarycolor,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
              },
            )),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ).copyWith(
                  top: 5.h, bottom: MediaQuery.of(context).viewInsets.bottom.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Appcolor.primarycolor,
                      decoration: InputDecoration(
                          hintText: "Your message",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: CupertinoColors.systemGrey),
                              borderRadius: BorderRadius.circular(20.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: CupertinoColors.systemGrey),
                              borderRadius: BorderRadius.circular(20.sp))),
                    ),
                  ),
                  20.w.widthBox,
                  Container(
                    height: 50.h,
                    width: 55.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: Icon(
                      Icons.send,
                      color: Appcolor.primarycolor,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
            .02.sh.heightBox,
          ],
        ),
      );
    },
  );
}

List messages = [
  {
    "message":
        "Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄",
    "time": "2:55 PM",
    "sendby": "me"
  },
  {
    "message":
        "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ",
    "time": "5:55 PM",
    "sendby": "no"
  },
  {
    "message":
        "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ",
    "time": "5:55 PM",
    "sendby": "me"
  },
  {"message": "yes bro", "time": "5:55 PM", "sendby": "no"},
  {"message": "kaise ho aap", "time": "5:55 PM", "sendby": "no"},
  {"message": "Good Bro", "time": "5:55 PM", "sendby": "me"},
  {
    "message":
        "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ",
    "time": "5:55 PM",
    "sendby": "no"
  },
];
