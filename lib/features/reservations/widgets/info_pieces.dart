import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/devider.dart';
import '../../../commun/widgets/imdb_rate.dart';

class Infos extends StatelessWidget {
  const Infos({
    super.key,
    required this.type,
    required this.startsAfter,
    required this.rate,
  });

  final String type;
  final String startsAfter;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoPiece(
          iconPath: 'assets/icons/ticket.svg',
          title: type,
        ),
        const SizedBox(width: 5),
        const Devider(),
        const SizedBox(width: 5),
        InfoPiece(
          iconPath: 'assets/icons/clock.svg',
          title: startsAfter,
        ),
        const Spacer(),
        IMDBRate(rate: rate)
      ],
    );
  }
}

class InfoPiece extends StatelessWidget {
  const InfoPiece({
    super.key,
    required this.iconPath,
    required this.title
  });

  final String iconPath,title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 5),
        Text(
          title,
          style: TextStyles.style11,
        )
      ],
    );
  }
}