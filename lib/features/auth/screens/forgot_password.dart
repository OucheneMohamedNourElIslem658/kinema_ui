import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/otp_bottom_sheet.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/auth/widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '/features/auth/widgets/custom_text_field.dart';
import '../../../commun/widgets/vertical_scroll_behaviour.dart';
import '../../../commun/constents/text_styles.dart';
import '../controllers/auth.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

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
              child: SvgPicture.asset('assets/icons/back_arrow.svg'),
            ),
            const SizedBox(height: 20),
            Text(
              'Email address or username',
              style: TextStyles.style4,
            ),
            const SizedBox(height: 10),
            Form(
              key: authController.emailFormKey,
              child: CustomTextField(
                controller: authController.emailController,
                validator: (p0) => authController.emailValidation(),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We will send you an email containing a link to sing in.',
              style: TextStyles.style7,
            ),
            const SizedBox(height: 60),
            Center(
              child: CustomElevatedButton(
                  onPressed: () async {
                    if (authController.validateEmail()) {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: const CustomBottomSheet(),
                        ),
                      );
                    }
                  },
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  child: Text('Send a pin', style: TextStyles.style2)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ))),
    );
  }
}