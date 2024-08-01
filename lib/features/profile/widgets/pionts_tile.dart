import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/profile/controllers/profile_form.dart';

import '../../../commun/widgets/custom_text_loader.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/fidelity/screens/fidelity_market.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class PointsTile extends StatelessWidget {
  const PointsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileFormController = Get.put(ProfileFormController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomColors.greyBorder2
        )
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fidelty Points',
                    style: TextStyles.style35,
                  ),
                  GetBuilder<ProfileFormController>(
                    builder: (_) {
                      return Row(
                        children: [
                          profileFormController.currentUser != null
                          ? Text(
                            profileFormController.currentUser!.fidelityPoints.toString(),
                            style: TextStyles.style36,
                          )
                          :const CustomTextLoader(height: 15, width: 50),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            'assets/icons/cinema.svg',
                            // ignore: deprecated_member_use
                            color: CustomColors.primaryBej,
                          )
                        ],
                      );
                    }
                  ),
                ],
              )
            ),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                onPressed: () => push(context, const FidelityMarketScreen()), 
                icon: SvgPicture.asset(
                  'assets/icons/shop_bag.svg',
                  height: 25,
                  width: 25,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}