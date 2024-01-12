import 'package:dating/backend/fake_data.dart';
import 'package:dating/backend/post_model.dart';
import 'package:dating/resource/components/buttons/back_btn.dart';
import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/auth_view/sign_up/profile_details.dart';
import 'package:dating/view/home/view_profile/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:velocity_x/velocity_x.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Postmodel> fakeData =
      DataFake.fake.map((e) => Postmodel.fromJson(e)).toList();
  MatchEngine? matchEngine;

  final List<SwipeItem> swipeItems = <SwipeItem>[];
  @override
  void initState() {
    for (var e in fakeData) {
      swipeItems.add(SwipeItem(
        content: e,
        likeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Liked ${e.id}}"),
            duration: const Duration(milliseconds: 500),
          ));
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Nope ${e.id}"),
            duration: const Duration(milliseconds: 500),
          ));
        },
        superlikeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Superliked ${e.id}"),
            duration: const Duration(milliseconds: 500),
          ));
        },
        onSlideUpdate: (slideRegion) async {
          return null;
        },
      ));
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search friend’s",
                  style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
                ),
                backBtn(
                  context,
                  icon: Icons.settings_input_composite_outlined,
                  onTap: () {},
                ),
              ],
            ),
            10.h.heightBox,
            Expanded(
                child: SwipeCards(
              likeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: const Text('Like'),
              ),
              nopeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: const Text('Nope'),
              ),
              superLikeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.orange)),
                child: const Text('Super Like'),
              ),
              leftSwipeAllowed: true,
              rightSwipeAllowed: true,
              upSwipeAllowed: true,
              fillSpace: true,
              matchEngine: matchEngine!,
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Utils.nextscreen(context, ViewProfileView()),
                  child: Container(
                      height: double.infinity,
                      alignment: Alignment.bottomCenter,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(dummyImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Container(
                        width: double.maxFinite,
                        height: 100.h,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.r),
                                bottomRight: Radius.circular(25.r)),
                            color: Appcolor.primarycolor.withOpacity(.2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vikrant, 25",
                              style: ApptextStyle.style25bold.copyWith(
                                  color: Colors.white, fontSize: 30.sp),
                            ),
                            5.h.heightBox,
                            Text(
                              "Software Developer",
                              style: ApptextStyle.style25bold.copyWith(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                          ],
                        ),
                      )),
                );
              },
            )),
            10.h.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: .05.sw),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          matchEngine!.currentItem!.nope();
                        },
                        child: Container(
                          height: 80.h,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .8,
                                    spreadRadius: 2,
                                    color: Colors.grey,
                                    blurStyle: BlurStyle.outer)
                              ]),
                          child: Icon(
                            Icons.close,
                            color: const Color(0xffF27121),
                            size: 35.sp,
                          ),
                        ),
                      )),
                  20.w.widthBox,
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          matchEngine!.currentItem!.like();
                        },
                        child: Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                              color: Appcolor.primarycolor,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: .8,
                                    spreadRadius: 2,
                                    color: Colors.grey,
                                    blurStyle: BlurStyle.outer)
                              ]),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 55.sp,
                          ),
                        ),
                      )),
                  20.w.widthBox,
                  Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          matchEngine!.currentItem!.superLike();
                        },
                        child: Container(
                          height: 80.h,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .8,
                                    spreadRadius: 2,
                                    color: Colors.black,
                                    blurStyle: BlurStyle.outer)
                              ]),
                          child: Icon(
                            Icons.star,
                            color: const Color(0xff8A2387),
                            size: 45.sp,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            20.h.heightBox,
          ],
        ),
      )),
    );
  }
}
