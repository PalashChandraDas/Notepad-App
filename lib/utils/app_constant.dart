import 'package:flutter/cupertino.dart';

class AppConstant{
  static Widget kDefaultGap = const SizedBox(height: 12);
  static kWidth({required BuildContext context}){
    return MediaQuery.of(context).size.width;
  }
  static kHeight({required BuildContext context}){
    return MediaQuery.of(context).size.height;
  }

}