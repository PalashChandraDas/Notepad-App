import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_color.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({super.key, required this.onPressed ,this.isChangeColor = true,
  this.isIconSize = false});

  final void Function() onPressed;
  final bool isChangeColor;
  final bool isIconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.image_outlined,
        size: isIconSize? 35.w:25.w ,
        color: isChangeColor ? CustomColor.primaryColor: CustomColor.textHintColor.withOpacity(.3),
      ),
    );
  }
}
