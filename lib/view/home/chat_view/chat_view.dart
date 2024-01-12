import 'package:dating/resource/const/color/colors.dart';
import 'package:dating/resource/const/style/textstyle.dart';
import 'package:dating/view/auth_view/sign_up/profile_details.dart';
import 'package:dating/view/home/message_view/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
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
              "Messages",
              style: ApptextStyle.style11bold.copyWith(fontSize: 30.sp),
            ),
            20.h.heightBox,
            Expanded(
                child: ListView.builder(
              itemCount: 50,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp)),
                  shadowColor: CupertinoColors.systemGrey,
                  child: ListTile(
                    onTap: () => showMessageTile(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        dummyImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: const Text("Vikrant Jain"),
                    subtitle: const Text("Hello Vikrant How Are you"),
                    trailing: Column(
                      children: [
                        const Text("23 min"),
                        Expanded(
                            child: Container(
                          width: 25.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Appcolor.primarycolor),
                          child: Text(
                            "12",
                            style: ApptextStyle.style12bold
                                .copyWith(color: Colors.white),
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}
