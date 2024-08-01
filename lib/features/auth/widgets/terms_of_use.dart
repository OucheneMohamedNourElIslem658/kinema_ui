import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../commun/constents/text_styles.dart';

class TermsOfUseText extends StatelessWidget {
  const TermsOfUseText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By tapping “Create account”, you agree to the Kinema ',
            style: TextStyles.style7
          ),
          TextSpan(
            text: 'Terms of Use.',
            style: TextStyles.style9.copyWith(
              decoration: TextDecoration.underline
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = (){},
          )
        ]
      )
    );
  }
}