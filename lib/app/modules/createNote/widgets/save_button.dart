import 'package:flutter/material.dart';

import '../../../../utils/app_constant.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstant.kWidth(context: context),
      child: ElevatedButton(
          onPressed: onPressed,
          child: const Text('Save', style: TextStyle(
            fontSize: 18
          ),)),
    );
  }
}
