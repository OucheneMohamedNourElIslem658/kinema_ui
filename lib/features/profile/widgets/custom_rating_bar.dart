import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.rate,
    this.enableRate = false,
    this.onUpdateRate,
  });

  final double rate;
  final bool enableRate;
  final void Function(double)? onUpdateRate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
      itemSize: 14,
      itemBuilder: (context, _) => SvgPicture.asset(
        'assets/icons/star.svg',
      ),
      unratedColor: CustomColors.grey,
      ignoreGestures: !enableRate,
      onRatingUpdate: onUpdateRate ?? (rating) {},
      updateOnDrag: true,
    );
  }
}
