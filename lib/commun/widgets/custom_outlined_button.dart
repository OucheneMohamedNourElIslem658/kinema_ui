import 'package:flutter/material.dart';
import 'package:kinema_dashboard/commun/constents/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key, 
    required this.onPressed, 
    this.child
  });

  final VoidCallback onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 35
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        side: BorderSide(
          color: CustomColors.grey1
        )
      ),
      child: child
    );
  }
}