import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kinema/features/fidelity/screens/card.dart';

import '/commun/utils/navigation_methods.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/widgets/custom_icon_button.dart';

class BagButton extends StatelessWidget {
  const BagButton({
    super.key,
    this.addRedDot = false
  });

  final bool addRedDot;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomIconButton(
          onPressed: () => push(context, const CardScreen()),
          backgroundColor: CustomColors.black8,
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/icons/card.svg'
          ), 
        ),
        addRedDot
        ? Positioned(
          bottom: 5,
          right: 14,
          child: Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.primaryRed
            ),
          ),
        )
        : const SizedBox()
      ],
    );
  }
}