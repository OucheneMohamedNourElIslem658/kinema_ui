import 'package:flutter/material.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/movie_edit_dialog.dart';

import '/commun/constents/text_styles.dart';
import '/commun/widgets/dialog_card.dart';

import '../../../commun/widgets/custom_elevated_button.dart';

class MoviePreviewDialog extends StatelessWidget {
  const MoviePreviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AVATAR",
              style: TextStyles.style6,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Poster(picURL: "https://i.ebayimg.com/images/gCwEAAOSwv4xf5cdv/s-l1600.jpg"),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InfoWidget(label: "Movie Type", value: "Action, Adventure, Drama"),
                      const SizedBox(height: 12),
                      const InfoWidget(label: "Language", value: "English"),
                      const SizedBox(height: 12),
                      const InfoWidget(label: "Seat Price", value: "20 USD"),
                      const SizedBox(height: 12),
                      const InfoWidget(label: "PO", value: "+18"),
                      const SizedBox(height: 12),
                      const InfoWidget(label: "Rate", value: "7.5"),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            barrierDismissible: false,
                            builder: (context) {
                              return const MovieEditDialog();
                            }
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 35
                          ),
                          radius: 5,
                          child: Text(
                            "Edit",
                            style: TextStyles.style9,
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key, 
    required this.label, 
    required this.value
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.style8,
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyles.style5,
        )
      ],
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.picURL
  });

  final String picURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(picURL),
          fit: BoxFit.cover
        )
      ),
    );
  }
}