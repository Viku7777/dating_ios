import 'package:dating/view/onboarding_view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dating/view_model/controller/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      child: GetMaterialApp(
        initialBinding: InitBinding(),
        title: 'Dating',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "SK-Reg",
        ),
        home: const OnboardingView(),
      ),
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthControllers());
  }
}
