import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/text_styles.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SvgPicture.asset('assets/images/screen.svg'),
        Text(
          'SCREEN',
          style: TextStyles.style16,
        )
      ],
    );
  }
}