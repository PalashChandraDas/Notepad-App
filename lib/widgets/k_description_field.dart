import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/custom_string.dart';

class KDescriptionField extends StatelessWidget {
  const KDescriptionField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 20,
      // maxLength: 5000,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: CustomString.descriptionHint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: CustomColor.textHintColor),
      ),
    );
  }
}
