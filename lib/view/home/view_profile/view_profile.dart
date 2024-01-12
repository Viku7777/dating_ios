// ignore_for_file: must_be_immutable

import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/view/auth_view/sign_up/profile_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewProfileView extends StatelessWidget {
  ViewProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: .5.sh,
          backgroundColor: Appcolor.primarycolor,
          flexibleSpace: FlexibleSpaceBar(
              title: const Text('Vikrant Jain', textScaleFactor: 1),
              background: Image.network(
                dummyImage,
                fit: BoxFit.cover,
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .05.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.heightBox,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hello i'm Software Developer in hexa and i'm from hisar",
                    textAlign: TextAlign.center,
                    style: ApptextStyle.style11bold.copyWith(fontSize: 20.sp),
                  ),
                ),
                20.h.heightBox,
                Text(
                  "About",
                  style: ApptextStyle.style11bold.copyWith(fontSize: 16.sp),
                ),
                10.h.heightBox,
                ReadMoreText(
                  "dhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklhcsghrsegjdsg kgkdfkgs hgk,dfghdfhg, fhdkgsdgd dkfdsg sdrghkdskgfdhgklslkx rskgl ",
                  trimLines: 4,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: ApptextStyle.style14bold
                      .copyWith(color: CupertinoColors.systemGrey),
                ),
                20.h.heightBox,
                Text(
                  "Interests",
                  style: ApptextStyle.style11bold.copyWith(fontSize: 16.sp),
                ),
                20.h.heightBox,
                Wrap(
                    children: favdata
                        .map((e) => Container(
                              padding: EdgeInsets.all(10.sp),
                              margin: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  border: Border.all(
                                      color: Appcolor.primarycolor,
                                      width: 2.w)),
                              child: Text(
                                e,
                                style: ApptextStyle.style16bold
                                    .copyWith(color: Appcolor.primarycolor),
                              ),
                            ))
                        .toList()),
                20.h.heightBox,
                Text(
                  "Gallery",
                  style: ApptextStyle.style11bold.copyWith(fontSize: 16.sp),
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
                50.h.heightBox,
              ],
            ),
          )
        ]))
      ],
    ));
  }

  List favdata = ["Long Driving", "Photography", "Shopping", "Yoga", "Cricket"];
}
