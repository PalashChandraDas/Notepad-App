import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/custom_string.dart';
class KTitleField extends StatelessWidget {
  const KTitleField({super.key, required this.controller,});

  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      autofocus: true,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: CustomString.titleHint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: CustomColor.textHintColor,
            fontSize: 20),
      ),
    );
  }
}
