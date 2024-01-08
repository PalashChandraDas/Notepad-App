import 'package:flutter/material.dart';

Widget deleteImageButton({required void Function() onPressed}) =>
    IconButton(onPressed: onPressed, icon: const Icon(Icons.clear));
