import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class CustomTitleTextField extends StatelessWidget {
  const CustomTitleTextField({
    super.key,
    this.controller
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movie Title",
          style: TextStyles.style8,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.grey2.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5)
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: CustomColors.primaryBlack,
            style: TextStyles.style1.copyWith(
              color: CustomColors.primaryBlack
            ),
            maxLines: 1,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10
              )
            ),
          ),
        ),
      ],
    );
  }
}