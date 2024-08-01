import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/utils/navigation_methods.dart';
import 'package:kinema/features/auth/screens/password.dart';
import '../controllers/auth.dart';
import '/features/auth/widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '/features/auth/widgets/custom_text_field.dart';

import '../../../commun/constents/text_styles.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      body: Background(
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
              'What’s your email?',
              style: TextStyles.style4,
            ),
            const SizedBox(height: 15),
            Form(
              key: authController.emailFormKey,
              child: CustomTextField(
                controller: authController.emailController,
                validator: (p0) => authController.emailValidation(),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You’ll need to confirm this email later.',
              style: TextStyles.style7,
            ),
            const SizedBox(height: 30),
            Center(
              child: CustomElevatedButton(
                onPressed: (){
                  if (authController.validateEmail()) {
                    push(context, const PasswordScreen());
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
    );
  }
}