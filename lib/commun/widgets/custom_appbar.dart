import 'package:flutter/material.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/confirmation_dialog.dart';

import '../constents/text_styles.dart';
import '../../features/diffusions/widgets/notification_button.dart';
import 'cutom_icon_button.dart';

SliverAppBar getCustomAppBar(BuildContext context,{required String title}) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          title,
          style: TextStyles.style2,
        ),
      ),
      actions: [
        Tooltip(
          message: "logout",
          textStyle: TextStyles.style1.copyWith(
            color: Colors.white
          ),
          child: CustomIconButton(
            iconPath: "assets/icons/logout.svg",
            onPressed: () => showDialog(
              context: context,
              barrierDismissible: false,
              barrierColor: Colors.transparent,
              builder: (context) {
                return ConfirmationDialog(
                  onConfirm: (){}, 
                  confirmMessage: "Logout",
                  title: "Do you really want to logout ?", 
                  description: "If you logout you will not be autirized to do any actions on the dashboard."
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 5),
        NotificationsButton(
          onPressed: (){}
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 30),
      ],
    );
  }