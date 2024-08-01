import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constents/text_styles.dart';
import 'custom_elevated_button.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
    required this.onPressed
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed, 
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Download',
            style: TextStyles.style2,
          ),
          const SizedBox(width: 15),
          SvgPicture.asset('assets/icons/download.svg')
        ],
      )
    );
  }
}