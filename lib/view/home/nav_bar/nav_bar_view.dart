import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/images/images.dart';
import 'package:dating/view/home/chat_view/chat_view.dart';
import 'package:dating/view/home/like_view/like_view.dart';
import 'package:dating/view/home/main_view/main_view.dart';
import 'package:dating/view/home/profile_view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBarViewScreen extends StatefulWidget {
  const NavBarViewScreen({super.key});

  @override
  State<NavBarViewScreen> createState() => _NavBarViewScreenState();
}

class _NavBarViewScreenState extends State<NavBarViewScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [MainView(), LikeView(), ChatView(), ProfileView()],
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Image.asset(
          ImageClass.home,
        ),
      ),
      activeColorPrimary: Appcolor.primarycolor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Image.asset(ImageClass.like),
      ),
      activeColorPrimary: Appcolor.primarycolor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Image.asset(ImageClass.chat),
      ),
      activeColorPrimary: Appcolor.primarycolor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Image.asset(ImageClass.profile),
      ),
      activeColorPrimary: Appcolor.primarycolor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
