import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/cutom_icon_button.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({
    super.key,
    this.isThereNew = true,
    required this.onPressed
  });

  final bool isThereNew;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "notifications",
      textStyle: TextStyles.style1.copyWith(
        color: Colors.white
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomIconButton(
            onPressed: (){},
            child: SvgPicture.asset("assets/icons/notification.svg",height: 30),
          ),
          if (isThereNew) Positioned(
            top: 9,
            right: 15,
            child: Container(
              height: 9,
              width: 9,
              decoration: BoxDecoration(
                color: CustomColors.primaryRed,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white
                )
              ),
            ),
          ) else const SizedBox()
        ],
      ),
    );
  }
}