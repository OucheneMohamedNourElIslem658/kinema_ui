import 'package:flutter/material.dart';

import '../../../commun/widgets/dialog_actions.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/dialog_card.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key, 
    required this.onConfirm,
    this.onCancel,
    this.confirmMessage, 
    required this.title, 
    required this.description
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String? confirmMessage;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 470),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.style6,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Text(
                description,
                style: TextStyles.style1.copyWith(
                  color: CustomColors.grey4
                ),
              ),
            ),
            const SizedBox(height: 20),
            DialogActions(
              onConfirm: onConfirm, 
              confirmMessage: confirmMessage
            )
          ],
        ),
      )
    );
  }
}