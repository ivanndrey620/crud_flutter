import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFieldWidget extends HookWidget {
  const CustomFieldWidget({
    super.key,
    this.initialValue,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
    this.onChangedCallback,
    this.onSubmittedCallback,
    this.onClickedCallback,
    this.maxLength,
  });

  final String? initialValue;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String content)? onChangedCallback;
  final Function(String content)? onSubmittedCallback;
  final VoidCallback? onClickedCallback;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    controller.text = initialValue ?? '';

    return TextField(
      maxLength: maxLength,
      onTap: () => onClickedCallback?.call(),
      readOnly: onClickedCallback != null,
      controller: controller,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: (value) => onChangedCallback?.call(value),
      onSubmitted: (value) => onSubmittedCallback?.call(value),
    );
  }
}
