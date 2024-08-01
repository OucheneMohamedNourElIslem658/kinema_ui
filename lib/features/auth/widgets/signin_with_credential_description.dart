import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/text_styles.dart';

class SignInWithCredentialDescription extends StatelessWidget {
  const SignInWithCredentialDescription({
    super.key, 
    required this.text, 
    required this.iconPath,
  });

  final String text,iconPath; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 20),
        Text(
          text,
          style: TextStyles.style2,
        ),
      ],
    );
  }
}