import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/utils/navigation_methods.dart';
import 'package:kinema/commun/widgets/custom_elevated_button.dart';
import 'package:kinema/features/auth/screens/birth_day.dart';
import '../controllers/genders.dart';
import '/features/auth/widgets/background.dart';

import '../../../commun/constents/text_styles.dart';
import '../widgets/genders.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gendersController = Get.put(GendersController());

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
              'What’s your gender?',
              style: TextStyles.style4
            ),
            const SizedBox(height: 10),
            const Genders(),
            const Spacer(flex: 3,),
            GetBuilder<GendersController>(
              builder: (_) {
                if (gendersController.doesUserSelectedGender) {
                  return Center(
                    child: CustomElevatedButton(
                      onPressed: () => push(context, const BirthDayScreen()), 
                      width: null,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                      child: Text(
                        'Next',
                        style: TextStyles.style2,
                      )
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }
            ),
            const Spacer(flex: 2),
          ],
        )
      ),
    );
  }
}