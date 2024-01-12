import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/view/auth_view/sign_up/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class LikeView extends StatefulWidget {
  const LikeView({super.key});

  @override
  State<LikeView> createState() => _LikeViewState();
}

class _LikeViewState extends State<LikeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Matches",
              style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
            ),
            10.h.heightBox,
            Text(
              "This is a list of people who have liked you \nand your matches.",
              style: ApptextStyle.style14Reg,
            ),
            20.h.heightBox,
            Expanded(
                child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .60.sp,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h),
              itemBuilder: (context, index) {
                return Container(
                  height: double.infinity,
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          dummyImage,
                          fit: BoxFit.cover,
                          height: double.maxFinite,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vikrant, 25",
                                style: ApptextStyle.style25bold.copyWith(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Appcolor.primarycolor.withOpacity(.3),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                    child: const VerticalDivider(
                                        color: Colors.white, thickness: 2),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // child: Container(
                  //   width: double.maxFinite,
                  //   padding: const EdgeInsets.all(20),
                  //   // decoration: BoxDecoration(
                  //   //     color: Appcolor.primarycolor.withOpacity(.2)),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Vikrant, 25",
                  //         style: ApptextStyle.style25bold
                  //             .copyWith(color: Colors.white, fontSize: 15.sp),
                  //       ),
                  //       5.h.heightBox,
                  //       const Row(
                  //         children: [

                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // )
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}
