import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/profile/controllers/profile_form.dart';

import '../../../commun/widgets/custom_text_loader.dart';
import '../controllers/settings.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/profile/screens/profile.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) { 
    final profileFormController = Get.put(ProfileFormController());
    final settingsContoller = Get.put(SettingsController());
    return GetBuilder<ProfileFormController>(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CustomColors.greyBorder2
            )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SizedBox(
                height: 54,
                width: 54,
                child: GetBuilder<SettingsController>(
                  builder: (_) {
                    return CircleAvatar(
                      backgroundImage: AssetImage(settingsContoller.currentAvatarPath),
                    );
                  }
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileFormController.currentUser == null
                      ? const CustomTextLoader(height: 15, width: 100)
                      : Text(
                        profileFormController.currentUser!.username!,
                        style: TextStyles.style34,
                      ),
                    const SizedBox(height: 3),
                    profileFormController.currentUser == null
                      ? const CustomTextLoader(height: 15, width: 150)
                      : Text(
                          profileFormController.currentUser!.email!,
                          style: TextStyles.style35,
                        ),
                  ],
                )
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => push(context, const ProfileScreen()),
                  // onPressed: () => getCurrentUser(),
                  icon: SvgPicture.asset('assets/icons/edit.svg'), 
                ),
              )
            ],
          ),
        );
      }
    );
  }
}