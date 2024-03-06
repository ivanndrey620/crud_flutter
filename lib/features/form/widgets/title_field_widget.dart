import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/features/form/widgets/custom_field_title_widget.dart';
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
    this.onClickedCallback,
  });

  final String title;
  final String? initialValue;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String content)? onChangedCallback;
  final Function(String content)? onSubmittedCallback;
  final VoidCallback? onClickedCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomFieldTitleWidget(title: title),
        ),
        Expanded(
          flex: 2,
          child: CustomFieldWidget(
            initialValue: initialValue,
            hintText: hintText,
            maxLines: maxLines,
            keyboardType: keyboardType,
            onChangedCallback: onChangedCallback,
            onSubmittedCallback: onSubmittedCallback,
            onClickedCallback: onClickedCallback,
          ),
        ),
      ],
    );
  }
}
