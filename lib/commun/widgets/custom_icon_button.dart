import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.backgroundColor
  });

  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: padding,
        shape: const CircleBorder(),
        side: BorderSide.none,
        backgroundColor: backgroundColor
      ),
      child: child,
    );
  }
}