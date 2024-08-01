import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    this.text, 
    this.textStyle,
    this.child
  });

  final VoidCallback onPressed;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
      child: child ?? Text(
        text ?? '',
        style: textStyle ?? TextStyles.style6.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: CustomColors.primaryBej,
        ),
      ),
    );
  }
}
