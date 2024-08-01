import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constents/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconPath,
    required this.onPressed
  });

  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: const BorderSide(
          color: Colors.transparent
        ),
        backgroundColor: CustomColors.grey3,
        padding: const EdgeInsets.all(15)
      ),
      child: SvgPicture.asset(
        iconPath,
        height: 30,
      )
    );
  }
}