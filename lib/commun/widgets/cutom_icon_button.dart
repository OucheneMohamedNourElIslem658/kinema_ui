import 'package:flutter/material.dart';

import '../constents/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.padding
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final double? padding; 

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: const BorderSide(
          color: Colors.transparent
        ),
        backgroundColor: backgroundColor ?? CustomColors.grey3,
        padding: EdgeInsets.all(padding ?? 15)
      ),
      child: child
    );
  }
}