import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';

class Indication extends StatelessWidget {
  const Indication({
    super.key, 
    required this.imagePath, 
    required this.description,
    this.topFlex,
    this.bottomFlex
  });

  final String imagePath;
  final String description;
  final int? topFlex,bottomFlex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(flex: topFlex ?? 2),
          SvgPicture.asset(imagePath),
          const SizedBox(height: 20),
          Text(
            description,
            style: TextStyles.style7.copyWith(
              color: CustomColors.greyText3
            )
          ),
          Spacer(flex: bottomFlex ?? 7)
        ],
      ),
    );
  }
}