import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/auth/screens/forgot_password.dart';
import '../controllers/auth.dart';
import '/features/auth/widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '../../../commun/widgets/vertical_scroll_behaviour.dart';
import '../../../commun/constents/text_styles.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: VerticalScrollBehaviour(
            child: Form(
              key: authController.loginFormKey,
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
                    'Email address or username',
                    style: TextStyles.style4,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: authController.emailController,
                    validator: (p0) => authController.emailValidation(),
                  ),
                  const SizedBox(height: 10),
                  const Spacer(),
                  Text(
                    'Password',
                    style: TextStyles.style4,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: authController.passwordController,
                    isPassword: true,
                    validator: (p0) => authController.passwordValidation(),
                  ),
                  const SizedBox(height: 10),
                  const Spacer(),
                  Center(
                    child: CustomElevatedButton(
                      onPressed: () async {
                        if(true){
                          await authController.loginUser(context);
                          // print("mohamed");
                        }
                      }, 
                      width: null,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      child: Text(
                        'Sign in', 
                        style: TextStyles.style3
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: CustomTextButton(
                      onPressed: () => push(context, const ForgotPasswordScreen()), 
                      text: 'You Forgot Your Password?'
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//123mohamed
//m_ouchene@estin.dz