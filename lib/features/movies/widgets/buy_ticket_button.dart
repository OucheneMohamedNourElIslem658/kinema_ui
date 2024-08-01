import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_elevated_button.dart';

class ByTicketButton extends StatelessWidget {
  const ByTicketButton({
    super.key,
    required this.onPressed
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 25,
          top: 70,
          left: 70,
          right: 70
        ),
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0,0,0.27,0.48,1],
            colors: [
              CustomColors.black6,
              CustomColors.black6.withOpacity(0),
              CustomColors.black6.withOpacity(0.4),
              CustomColors.black6.withOpacity(0.9),
              CustomColors.black6
            ]
          )
        ),
        child: CustomElevatedButton(
          onPressed: onPressed, 
          padding:const EdgeInsets.symmetric(horizontal: 60,vertical: 12),
          child: Text(
            'Buy Ticket',
            style: TextStyles.style2,
          )
        ),
      ),
    );
  }
}