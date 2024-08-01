import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/auth/widgets/custom_text_button.dart';
import '../constents/text_styles.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.onSeeMore,
    this.text
  });

  final VoidCallback onSeeMore;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: onSeeMore, 
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text ?? 'See More',
            style: TextStyles.style26,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset('assets/icons/arrow_forward_ios.svg')
        ],
      ),
    );
  }
}