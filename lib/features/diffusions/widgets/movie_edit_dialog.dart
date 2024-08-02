import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/diffusions/controllers/diffusions.dart';
import '/features/diffusions/widgets/trailers_drop_dow.dart';
import '../../../commun/widgets/dialog_actions.dart';
import '../../../commun/widgets/dialog_card.dart';
import '/commun/constents/text_styles.dart';
import 'editibale_text_field.dart';
import 'movie_poster.dart';
import 'movie_language_dropdown.dart';

class MovieEditDialog extends StatelessWidget {
  const MovieEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final diffusionsController = Get.put(DiffusionsController());
    final trailers = diffusionsController.trailers;
    
    return DialogCard(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicWidth(
              child: EditibaleTextField(
                controller: TextEditingController(text: "AVATAR"),
                style: TextStyles.style6,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MoviePoster(),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LanguageDropdownMenu(),
                      const SizedBox(height: 18),
                      MovieDescriptionTextField(
                        controller: TextEditingController(
                          text: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet."
                        ),
                      ),
                      const SizedBox(height: 12),
                      TrailersDropdownMenu(trailers: trailers)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            DialogActions(
              onConfirm: (){}, 
              buttonsAlignment: MainAxisAlignment.end,
              confirmMessage: "Save"
            )
          ],
        ),
      ),
    );
  }
}

class MovieDescriptionTextField extends StatelessWidget {
  const MovieDescriptionTextField({
    super.key, 
    required this.controller
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyles.style8,
        ),
        const SizedBox(height: 5),
        EditibaleTextField(
          controller: controller,
          maxLines: 2,
        ),
      ],
    );
  }
}