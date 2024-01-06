import 'package:flutter/material.dart';

class KHeading extends StatelessWidget {
  const KHeading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20,
      decoration: TextDecoration.underline),
    );
  }
}
