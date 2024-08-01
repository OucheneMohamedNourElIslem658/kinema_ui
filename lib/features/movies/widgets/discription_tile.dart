import 'package:flutter/material.dart';
import 'package:kinema/commun/models/movie.dart';

import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/imdb_rate.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile({
    super.key,
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${movie.name.substring(1,10)}...',
              overflow: TextOverflow.clip,
              style: TextStyles.style13,
            ),
            const SizedBox(width: 15),
            const IMDBRate(
              rate: 7.5,
            )
          ],
        ),
        Text(
          movie.type,
          style: TextStyles.style17,
        )
      ],
    );
  }
}