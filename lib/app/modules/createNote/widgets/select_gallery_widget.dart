import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_color.dart';

class SelectGalleryWidget extends StatelessWidget {
  const SelectGalleryWidget({super.key, required this.onPressed ,this.isChangeColor = true});

  final void Function() onPressed;
  final bool isChangeColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Icon(
        Icons.image_outlined,
        size: 35,
        color: isChangeColor ? CustomColor.primaryColor: CustomColor.textHintColor.withOpacity(.5),
      ),
    );
  }
}
