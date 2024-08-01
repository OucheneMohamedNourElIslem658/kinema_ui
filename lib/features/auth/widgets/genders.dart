import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/features/auth/controllers/genders.dart';

import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import 'cutom_outlined_button.dart';

class Genders extends StatelessWidget {
  const Genders({super.key});

  @override
  Widget build(BuildContext context) {
    final gendersController = Get.find<GendersController>();

    return GetBuilder<GendersController>(
      builder:(_) => Row(
        children: List.generate(
          gendersController.genders.length, 
          (index) {
            final type = gendersController.genders[index]['type'] as String;
            final isSelected = gendersController.genders[index]['isSelected'] as bool;

            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GenderButton(
                onPressed: () => gendersController.selectGender(index), 
                gender: type,
                isSelected: isSelected,
              ),
            );
          }
        )
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    this.isSelected = false,
    required this.onPressed,
    required this.gender
  });

  final bool isSelected;
  final VoidCallback onPressed;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: !isSelected
      ? CustomOutlinedButton(
        onPressed: onPressed, 
        child: Text(
          gender,
          style: TextStyles.style2,
        )
      )
      : CustomElevatedButton(
        onPressed: onPressed, 
        child: Text(
          gender,
          style: TextStyles.style2,
        )
      )
    );
  }
}