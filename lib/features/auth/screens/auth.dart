import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kinema/features/auth/screens/email.dart';
import 'package:kinema/features/auth/screens/sign_in.dart';

import '/commun/constents/text_styles.dart';
import '/commun/utils/custom_snack_bar.dart';
import '/commun/utils/navigation_methods.dart';
import '../widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '../widgets/cutom_outlined_button.dart';
import '../widgets/signin_with_credential_description.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),
              SvgPicture.asset('assets/images/logo.svg'),
              const Spacer(flex: 2),
              Text(
                'Sit back and... Action!',
                style: TextStyles.style1,
              ),
              const Spacer(flex: 4),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () async => push(context,const EmailScreen()),
                  child: Text(
                    'Sign up',
                    style: TextStyles.style2,
                  )
                ),
              ),
              const SizedBox(height: 10),
              CustomOutlinedButton(
                onPressed: () => showSnackBar('Not supported yet', context),
                child: const SignInWithCredentialDescription(
                  text: 'Continue with Google',
                  iconPath: 'assets/icons/google.svg',
                )
              ),
              const SizedBox(height: 10),
              CustomOutlinedButton(
                onPressed: () => showSnackBar('Not supported yet', context),
                child: const SignInWithCredentialDescription(
                  text: 'Continue with Facebook',
                  iconPath: 'assets/icons/fb.svg',
                )
              ),
              const SizedBox(height: 15),
              CustomOutlinedButton(
                width: null,
                showBorders: false,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                onPressed: () => push(context, const SignInScreen()),
                child: Text(
                  'Sign in',
                  style: TextStyles.style2,
                )
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}