import 'package:flutter/material.dart';

import '../constents/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, 
    required this.onPressed,
    this.padding,
    this.radius,
    required this.child
  });

  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.primaryRed,
        padding: padding ?? const EdgeInsets.symmetric(
          vertical: 23
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10)
        ),
      ),
      child: child
    );
  }
}