import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/models/fidelity_item.dart';
import 'package:kinema/features/fidelity/controllers/fidelity.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class MarketList extends StatelessWidget {
  const MarketList({
    super.key,
    required this.categorieName,
    required this.items
  });

  final String categorieName;
  final List<FidelityItem> items;

  @override
  Widget build(BuildContext context) {
    final cardController = Get.put(FidelityController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            categorieName,
            style: TextStyles.style22,
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Row(
                children: List.generate(
                  items.length, 
                  (index) {
                    final item = items[index];
                    return MarketItem(
                      name: item.name!, 
                      url: item.imgurl!, 
                      price: item.pointsPrice!,
                      onDelete: () => cardController.addItem(item),
                  );
                  }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MarketItem extends StatelessWidget {
  const MarketItem({
    super.key, 
    required this.name, 
    required this.url, 
    required this.price,
    required this.onDelete
  });

  final String name;
  final String url;
  final int price;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomColors.primaryBej
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.network(
              url,
              height: 106,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              name,
              style: TextStyles.style30,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              SvgPicture.asset('assets/icons/cinema.svg'),
              const SizedBox(width: 5),
              Text(
                price.toString(),
                style: TextStyles.style7.copyWith(
                  color: CustomColors.black
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onDelete,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: CustomColors.primaryRed,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                    )
                  ),
                  child: SvgPicture.asset('assets/icons/add.svg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}