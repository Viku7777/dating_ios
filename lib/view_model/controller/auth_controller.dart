// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating/resource/helper/utils.dart';
import 'package:dating/view/auth_view/sign_up/enter_otp.dart';

String verificationID = "";

class AuthControllers extends GetxController {
  FirebaseAuth fauth = FirebaseAuth.instance;
  bool loading = false;

  updateLoading() {
    loading = !loading;
    update();
  }

  Future<void> sendOTP(String number, BuildContext context,
      {bool isResendOTP = false}) async {
    try {
      verificationID = "";
      updateLoading();
      fauth.verifyPhoneNumber(
        phoneNumber: "+91$number",
        timeout: const Duration(minutes: 1),
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          updateLoading();
          Utils.flushBarSuccess(error.toString(), context);
        },
        codeSent: (verificationId, forceResendingToken) {
          updateLoading();
          verificationID = verificationID;
          if (!isResendOTP) {
            Utils.nextscreen(
                context,
                EnterOtpView(
                  number: number,
                ));
          }
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      updateLoading();
      Utils.flushBarSuccess(e.message.toString(), context);
    }
  }

  Future verifyPhoneNumber(
      String vid, String code, BuildContext context) async {
    try {
      updateLoading();
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vid, smsCode: code);
      UserCredential userCredential = await fauth
          .signInWithCredential(credential)
          .onError((error, stackTrace) => throw Exception(error.toString()));
      bool isnewUser = userCredential.additionalUserInfo!.isNewUser;
      String uid = userCredential.user!.uid;
      verificationID = "";
      return {"isnewUser": isnewUser, "credential": uid};
    } on FirebaseAuthException catch (e) {
      updateLoading();
      Utils.flushBarSuccess(e.message.toString(), context);
    }
  }
}
