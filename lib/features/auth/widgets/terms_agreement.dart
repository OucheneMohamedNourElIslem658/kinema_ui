import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/features/auth/controllers/terms_agreement.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class TermsAgreements extends StatelessWidget {
  const TermsAgreements({super.key});

  @override
  Widget build(BuildContext context) {
    final termsAgreementController = Get.put(TermsAgreementController());

    return GetBuilder<TermsAgreementController>(
      builder: (_) {
        return Column(
          children: List.generate(
            termsAgreementController.terms.length, 
            (index) {
              final term = termsAgreementController.terms[index];
              final termText = term['term'] as String;
              final isChecked = term['isChecked'] as bool;
              return Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: TermAgreement(
                  onTap: () {
                    termsAgreementController.checkTerm(index);
                  },
                  isChecked: isChecked,
                  termText: termText,
                ),
              );
            }
          ),
        );
      }
    );
  }
}

class TermAgreement extends StatelessWidget {
  const TermAgreement({
    super.key,
    this.onChanged,
    required this.onTap,
    required this.isChecked,
    required this.termText
  });

  final void Function(bool?)? onChanged;
  final VoidCallback onTap;
  final bool isChecked;
  final String termText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            termText,
            style: TextStyles.style10
          ),
        ),
        CustomCheckBox(
          onTap: onTap,
          checked: isChecked,
        ),
      ],
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    this.checked = false,
    required this.onTap
  });

  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33,
        width: 33,
        decoration: BoxDecoration(
          color: checked
            ? CustomColors.primaryRed
            : null,
          shape: BoxShape.circle,
          border: Border.all(
            color: !checked
            ?CustomColors.primaryBej
            :CustomColors.transparent,
            width: 2
          )
        ),
        child: checked
         ? const Icon(
           Icons.check,
           color: CustomColors.primaryBej,
         )
         : null
      ),
    );
  }
}