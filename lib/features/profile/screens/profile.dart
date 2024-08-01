import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/profile/controllers/settings.dart';

import '../../../commun/widgets/custom_text_loader.dart';
import '/commun/widgets/custom_icon_button.dart';
import '/features/profile/screens/edit_profile.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/profile/controllers/profile_form.dart';
import '../widgets/edit_profile_form.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/vertical_scroll_behaviour.dart';
import '/features/reservations/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.put(ProfileFormController());
    final settingsController = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Edit Profile',
        showTitle: true,
        onGoBack: () => pop(context),
        actions: [
          formController.enableForm == true
          ? IconButton(
            onPressed: () => formController.cancelEdit(context), 
            icon: SvgPicture.asset(
              'assets/icons/delete.svg',
              // ignore: deprecated_member_use
              color: CustomColors.white,
            )
          )
          : const SizedBox()
        ]
      ),
    
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: VerticalScrollBehaviour(
            child: GetBuilder<ProfileFormController>(
              builder: (_) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                          width: 120
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: GetBuilder<SettingsController>(
                            builder: (_) {
                              return CircleAvatar(
                                backgroundImage: AssetImage(settingsController.currentAvatarPath),
                              );
                            }
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CustomIconButton(
                            onPressed: () => push(context, const EditProfileScreen()), 
                            backgroundColor: CustomColors.black3,
                            child: SvgPicture.asset(
                              'assets/icons/edit2.svg',
                              height: 20,
                              width: 20,
                            )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
    
                    if (formController.currentUser == null) 
                      const CustomTextLoader(height: 15, width: 100) 
                    else 
                      Text(
                        formController.currentUser!.fullName!,
                        style: TextStyles.style34,
                      ),
                    const SizedBox(height: 5),
    
                    if (formController.currentUser == null) 
                      const CustomTextLoader(height: 15, width: 150) 
                    else 
                      Text(
                        formController.currentUser!.email!,
                        style: TextStyles.style35,
                      ),
                    const SizedBox(height: 30),
                    const EditProfileFrom(),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}