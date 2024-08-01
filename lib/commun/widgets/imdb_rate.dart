import 'package:flutter/material.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';

class IMDBRate extends StatelessWidget {
  const IMDBRate({
    super.key,
    required this.rate,
    this.fontSize, 
    this.paddingHor, 
    this.paddingVer,
    this.borderRadius
  });

  final double rate;
  final double? fontSize,borderRadius;
  final double? paddingHor,paddingVer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){}, 
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHor ?? 12,
          vertical: paddingVer ?? 6
        ),
        decoration: BoxDecoration(
          color: CustomColors.yellow,
          borderRadius: BorderRadius.circular(borderRadius ?? 10)
        ),
        child: Text(
          'IMDB $rate',
          style: TextStyles.style12.copyWith(
            fontSize: fontSize
          ),
        )
      ),
    );
  }
}