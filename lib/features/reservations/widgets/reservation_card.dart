import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kinema/commun/widgets/custom_network_image.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import 'info_pieces.dart';


class ReservationCard extends StatelessWidget {
  const ReservationCard({
    super.key,
    required this.imageURL,
    required this.movie,
    required this.date,
    required this.type,
    required this.startsAfter,
    required this.rate, 
    required this.onCancel,
  });

  final String imageURL;
  final String movie;
  final String date;
  final String type;
  final String startsAfter;
  final double rate;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: CustomColors.black3,
        borderRadius: BorderRadius.circular(12)
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            MovieImage(imageURL: imageURL),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.style5,
                        ),
                      ),
                      GestureDetector(
                        onTap: onCancel,
                        child: Text(
                          'Cancel',
                          style: TextStyles.style11,
                        ), 
                      )
                    ],
                  ),
                  Text(
                    date,
                    style: TextStyles.style11,
                  ),
                  const SizedBox(height: 5),
                  Infos(
                    type: type, 
                    startsAfter: startsAfter,
                    rate: rate
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imageURL,
  });

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 50,
      child: CustomNetworkImage(
        backgroundImageURL: imageURL,
        shimmerBorderRadius: 12,
      ),
    );
  }
}