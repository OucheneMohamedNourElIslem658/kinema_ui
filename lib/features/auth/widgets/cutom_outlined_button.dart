import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';


class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.showBorders = true,
    this.width,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool showBorders;
  final double? width;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          side: showBorders 
            ? const BorderSide(
              color: CustomColors.primaryBej,
              width: 3
            )
            : BorderSide.none
        ),
        child: child
      ),
    );
  }
}