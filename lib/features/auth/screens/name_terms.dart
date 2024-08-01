import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/utils/navigation_methods.dart';

import '/commun/utils/custom_snack_bar.dart';
import '../controllers/auth.dart';
import '../controllers/terms_agreement.dart';
import '/commun/constents/colors.dart';
import '/features/auth/widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '/features/auth/widgets/custom_text_field.dart';
import '../../../commun/widgets/vertical_scroll_behaviour.dart';
import '../../../commun/constents/text_styles.dart';
import '../widgets/terms_agreement.dart';
import '../widgets/terms_of_use.dart';

class NameTermsScreen extends StatelessWidget {
  const NameTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final termsAgreementController = Get.put(TermsAgreementController());

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: VerticalScrollBehaviour(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => pop(context),
                  child:  SvgPicture.asset('assets/icons/back_arrow.svg'),
                ),
                const SizedBox(height: 20),
                Text(
                  'What’s your name?',
                  style: TextStyles.style4
                ),
                Form(
                  key: authController.nameFormKey,
                  child: CustomTextField(
                    controller: authController.nameController,
                    validator: (p0) => authController.nameValidation(),
                  ),
                ),
                const SizedBox(height: 25),
                const Divider(
                  height: 1,
                  color: CustomColors.greyText1,
                ),
                const SizedBox(height: 25),
                const TermsOfUseText(),
                const SizedBox(height: 20),
                const Spacer(flex: 2),
                const TermsAgreements(),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () async {
                      if (authController.validateName()) {
                        termsAgreementController.updateIsAllChecked();
                        if (termsAgreementController.isAllChecked) {
                          await authController.registerUser(context);
                        } else {
                          showSnackBar('You need to check all terms', context);
                        }
                      }
                    }, 
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    child: Text(
                      'Create account',
                      style: TextStyles.style5
                    )
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(flex: 3)
              ]
            ),
          ),
        )
      ),
    );
  }
}

