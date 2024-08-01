import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/fidelity/controllers/fidelity.dart';

import '/commun/utils/navigation_methods.dart';
import '/commun/utils/custom_snack_bar.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/vertical_scroll_behaviour.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../../../commun/widgets/download_button.dart';
import '../widgets/invoice_info.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<FidelityController>();

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Invoice',
        showTitle: true,
        onGoBack: () {
          cardController.clearCard();
          pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: VerticalScrollBehaviour(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(
                  color: CustomColors.grey,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20,right: 30),
                      child: InvoiceInfo(),
                    ),
                    const SizedBox(height: 30),
                    SvgPicture.asset('assets/images/dashed_line.svg'),
                    const SizedBox(height: 15),
                    Image.asset('assets/images/barcode.png'),              
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  'You’ll Receive this in email as well Show this to Kinema’s cashier!',
                  style: TextStyles.style7.copyWith(
                    color: CustomColors.greyText3
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Spacer(flex: 2),
              Center(
                child: DownloadButton(
                  onPressed: () {
                    
                    showSnackBar('Cart downloaded successfully', context);
                  },
                ),
              ),
              const Spacer(),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}