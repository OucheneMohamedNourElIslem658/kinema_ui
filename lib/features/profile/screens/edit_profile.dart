import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings.dart';
import '../widgets/avatars.dart';
import '/commun/utils/navigation_methods.dart';
import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsContoller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Edit Avatar',
        showTitle: true,
        onGoBack: () => pop(context)
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            GetBuilder<SettingsController>(
              builder: (_) {
                return SizedBox(
                  height: 108,
                  width: 108,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(settingsContoller.currentAvatarPath),
                  ),
                );
              }
            ),
            const SizedBox(height: 30),
            const Avatars()
          ],
        ),
      ),
    );
  }
}