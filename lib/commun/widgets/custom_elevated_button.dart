import 'package:flutter/material.dart';

import '../constents/colors.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.width,
    this.color, 
  });

  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? CustomColors.primaryRed,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: child
      ),
    );
  }
}
