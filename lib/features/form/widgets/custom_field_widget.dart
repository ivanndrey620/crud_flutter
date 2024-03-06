import 'package:flutter/material.dart';
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
  });

  final String? initialValue;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String content)? onChangedCallback;
  final Function(String content)? onSubmittedCallback;
  final VoidCallback? onClickedCallback;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);

    return TextField(
      onTap: () => onClickedCallback?.call(),
      readOnly: onClickedCallback != null,
      controller: controller,
      decoration: InputDecoration(
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
