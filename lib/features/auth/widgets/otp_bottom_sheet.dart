import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/utils/navigation_methods.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '../../../commun/widgets/custom_icon_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: CustomColors.primaryBej,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: CustomIconButton(
                onPressed: () => pop(context),
                child: SvgPicture.asset(
                  'assets/icons/back_arrow.svg',
                  height: 30,
                  // ignore: deprecated_member_use
                  color: CustomColors.primaryRed,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'We sent you a code to verify your number',
              style: TextStyles.style2.copyWith(color: CustomColors.black),
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomOTPTextField(),
          ),
          const SizedBox(height: 20),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Didn’t receive? ',
              style: TextStyles.style24.copyWith(color: CustomColors.black),
            ),
            TextSpan(
              text: 'Resend',
              recognizer: TapGestureRecognizer()..onTap = () {},
              style:
                  TextStyles.style14.copyWith(color: CustomColors.primaryRed),
            ),
          ])),
          const SizedBox(height: 20),
          CustomElevatedButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
              child: Text(
                'Continue',
                style: TextStyles.style41,
              )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CustomOTPTextField extends StatelessWidget {
  const CustomOTPTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
        // controller: otpController,
        length: 6,
        width: double.maxFinite,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        otpFieldStyle: OtpFieldStyle(
          backgroundColor: CustomColors.greyText3,
          borderColor: CustomColors.transparent,
          enabledBorderColor: CustomColors.transparent,
          errorBorderColor: CustomColors.primaryRed,
          focusBorderColor: CustomColors.transparent,
        ),
        // fieldStyle: FieldStyle.box,
        outlineBorderRadius: 12,
        style: TextStyles.style5.copyWith(
          color: CustomColors.black,
        ),
        onChanged: (pin) {},
        onCompleted: (pin) {});
  }
}

//m_ouchene@estin.dz
