import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';
import 'custom_elevated_button.dart';
import 'custom_outlined_button.dart';

class DialogActions extends StatelessWidget {
  const DialogActions({
    super.key,
    this.onCancel,
    required this.onConfirm,
    this.confirmMessage, 
    this.buttonsAlignment,
  });

  final VoidCallback? onCancel;
  final VoidCallback onConfirm;
  final String? confirmMessage;
  final MainAxisAlignment? buttonsAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: buttonsAlignment ?? MainAxisAlignment.center,
      children: [
        CustomOutlinedButton(
          onPressed: onCancel ?? () => context.pop(),
          child: Text(
            "Cancel",
            style: TextStyles.style9.copyWith(
              color: CustomColors.grey1
            ),
          ),
        ), 
        const SizedBox(width: 30),
        CustomElevatedButton(
          onPressed: onConfirm, 
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 35
          ),
          radius: 5,
          child: Text(
            confirmMessage ?? "Confirm",
            style: TextStyles.style9,
          )
        )
      ],
    );
  }
}