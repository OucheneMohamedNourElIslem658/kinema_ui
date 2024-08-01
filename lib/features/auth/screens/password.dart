import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/widgets/vertical_scroll_behaviour.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/auth/screens/gender_screen.dart';
import '../controllers/auth.dart';
import '/features/auth/widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '/features/auth/widgets/custom_text_field.dart';
import '../../../commun/constents/text_styles.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      body: Background(
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
                'Create a password',
                style: TextStyles.style4,
              ),
              const SizedBox(height: 15),
              Form(
                key: authController.passwordFormKey,
                child: CustomTextField(
                  isPassword: true,
                  controller: authController.passwordController,
                  validator: (p0) => authController.passwordValidation(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Use at least 10 alphanumerical characters.',
                style: TextStyles.style7,
              ),
              const SizedBox(height: 30),
              Center(
                child: CustomElevatedButton(
                  onPressed: (){
                    if (authController.validatePassword()) {
                      push(context, const GenderScreen());
                    }
                  }, 
                  width: null,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  child: Text(
                    'Next',
                    style: TextStyles.style2,
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}