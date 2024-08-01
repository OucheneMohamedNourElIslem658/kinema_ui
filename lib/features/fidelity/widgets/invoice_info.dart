import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/fidelity/controllers/fidelity.dart';
import 'package:kinema/features/profile/controllers/profile_form.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class InvoiceInfo extends StatelessWidget {
  const InvoiceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cardConroller = Get.put(FidelityController());
    final profileController = Get.put(ProfileFormController());


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fidelty Items',
          style: TextStyles.style13.copyWith(
            color: CustomColors.black
          ),
        ),
        Text(
          profileController.currentUser == null 
            ? '' 
            : profileController.currentUser!.fullName ?? '',
          style: TextStyles.style6.copyWith(
            color: CustomColors.black
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Items',
              style: TextStyles.style33,
            ),
            Text(
              'Points',
              style: TextStyles.style33,
            ),
          ],
        ),
        const SizedBox(height: 3),
        Column(
          children: List.generate(
            cardConroller.cardItems.length,
            (index) {
              final item = cardConroller.cardItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: PaymentItem(
                  price: item.pointsPrice!, 
                  itemName: item.name!
                ),
              );
            }
          ),
        ),
        const SizedBox(height: 15),
        const Row(
          children: [
            PointsInfo(
              title: 'Total',
              price: 2800,
            ),
            SizedBox(width: 40),
            PointsInfo(
              title: 'Remaining',
              price: 600,
            ),
          ],
        ),
      ],
    );
  }
}

class PointsInfo extends StatelessWidget {
  const PointsInfo({
    super.key,
    required this.title,
    required this.price
  });

  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.style33,
        ),
        PointsCount(price: price)
      ],
    );
  }
}

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key, 
    required this.price, 
    required this.itemName,
  });

  final int price;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            itemName,
            style: TextStyles.style6.copyWith(
              color: CustomColors.black
            ),
          ),
        ),
        PointsCount(price: price)
      ],
    );
  }
}

class PointsCount extends StatelessWidget {
  const PointsCount({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/icons/cinema.svg'),
        const SizedBox(width: 5),
        Text(
          price.toString(),
          style: TextStyles.style32,
        )
      ],
    );
  }
}