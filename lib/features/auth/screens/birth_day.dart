import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/auth/controllers/auth.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/auth/screens/name_terms.dart';
import '../../../commun/widgets/custom_cupertino_date_picker.dart';
import '/features/auth/widgets/background.dart';
import '../../../commun/widgets/custom_elevated_button.dart';

import '../../../commun/constents/text_styles.dart';

class BirthDayScreen extends StatelessWidget {
  const BirthDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      body: Background(
        child: SafeArea(
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
                'What’s your date of birth?',
                style: TextStyles.style4,
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 130,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -1000,
                        left: 0,
                        right: 0,
                        bottom: -1000,
                        child: CustomCupertinoDatePicker(
                          onDateChanged: (date) => authController.dateOfBirth = date,
                        )
                      ),
                    ],
                  )
                )
              ),
              const Spacer(flex: 3),
              Center(
                child: CustomElevatedButton(
                  onPressed: () {
                    push(context, const NameTermsScreen());
                  }, 
                  width: null,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  child: Text(
                    'Next',
                    style: TextStyles.style2,
                  )
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}