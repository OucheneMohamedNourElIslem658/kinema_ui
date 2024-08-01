import 'package:flutter/material.dart';

import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_elevated_button.dart';

class AddMovieButton extends StatelessWidget {
  const AddMovieButton({
    super.key,
    required this.onPressed
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            "Add Movie",
            style: TextStyles.style3,
          )
        ],
      ),
    );
  }
}