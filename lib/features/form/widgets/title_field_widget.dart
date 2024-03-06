import 'package:crud_flutter/features/features.dart';
import 'package:flutter/material.dart';

class TitleFieldWidget extends StatelessWidget {
  const TitleFieldWidget({
    super.key,
    required this.title,
    this.initialValue,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
    this.onChangedCallback,
    this.onSubmittedCallback,
  });

  final String title;
  final String? initialValue;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String content)? onChangedCallback;
  final Function(String content)? onSubmittedCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _CustomFieldTitle(title: title)),
        Expanded(
          flex: 2,
          child: CustomFieldWidget(
            initialValue: initialValue,
            hintText: hintText,
            maxLines: maxLines,
            keyboardType: keyboardType,
            onChangedCallback: onChangedCallback,
            onSubmittedCallback: onSubmittedCallback,
          ),
        ),
      ],
    );
  }
}

class _CustomFieldTitle extends StatelessWidget {
  const _CustomFieldTitle({required this.title});

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
