import 'package:flutter/material.dart';

class AppConstant {
  static Widget kDefaultGap = const SizedBox(height: 12);
  static kWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static kHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static customToast({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
