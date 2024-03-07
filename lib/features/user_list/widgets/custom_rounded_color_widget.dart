import 'package:flutter/material.dart';

class CustomRoundedColorWidget extends StatelessWidget {
  const CustomRoundedColorWidget({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: child,
      ),
    );
  }
}
