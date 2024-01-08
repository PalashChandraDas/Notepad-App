import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_color.dart';
import '../utils/custom_string.dart';

class KImageFile extends StatelessWidget {
  const KImageFile({super.key, required this.imageFile, });

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h, child: Image.file(imageFile,errorBuilder: (context, error, stackTrace) {
      return Center(child: Text(CustomString.imgErrorTxt, style: TextStyle(
          color: CustomColor.errorColor,
          fontSize: 20.sp,
          fontStyle: FontStyle.italic
      ),),);
    },));
  }
}
