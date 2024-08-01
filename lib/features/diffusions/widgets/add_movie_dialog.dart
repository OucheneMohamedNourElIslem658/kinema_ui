import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/movie_language_dropdown.dart';

import '/features/diffusions/controllers/diffusions.dart';
import '/features/diffusions/widgets/trailers_drop_dow.dart';
import '../../../commun/widgets/dialog_actions.dart';
import '../../../commun/widgets/dialog_card.dart';
import '/commun/constents/text_styles.dart';
import 'custom_title_text_field.dart';
import 'movie_poster.dart';

class AddMovieDialogBox extends StatelessWidget {
  const AddMovieDialogBox({super.key});

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
            Text(
              "Add New Movie",
              style: TextStyles.style6,
            ),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MoviePoster(),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTitleTextField(),
                        const SizedBox(height: 12),
                        const LanguageDropdownMenu(),
                        const SizedBox(height: 12),
                        TrailersDropdownMenu(trailers: trailers),
                      ],
                    ),
                  )
                ],
              ),
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