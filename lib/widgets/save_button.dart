import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notepad/utils/custom_color.dart';
import 'package:notepad/utils/custom_string.dart';


class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(CustomString.saveBtnTitle, style: TextStyle(
          fontSize: 18.sp,
          color: CustomColor.blackColor
        ),));
  }
}
