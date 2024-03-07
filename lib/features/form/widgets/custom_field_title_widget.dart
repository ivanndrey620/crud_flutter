import 'package:flutter/material.dart';

class CustomFieldTitleWidget extends StatelessWidget {
  const CustomFieldTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }
}
