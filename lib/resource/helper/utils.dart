import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static nextscreen(BuildContext context, dynamic screen) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => screen,
      ));
  static nextScreenWithRemove(BuildContext context, dynamic screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
          (route) => false);
  static flushBarSuccess(String message, BuildContext context,
      {bool isError = true}) async {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          message: message,
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: isError ? Colors.red : Colors.green,
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          icon: Icon(
            isError ? Icons.error : Icons.check_circle,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }
}
