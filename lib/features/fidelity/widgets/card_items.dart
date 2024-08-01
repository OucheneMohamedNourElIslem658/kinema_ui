import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/widgets/vertical_scroll_behaviour.dart';
import 'package:kinema/features/fidelity/controllers/fidelity.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_icon_button.dart';
import 'empty_card.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.cardController
  });

  final FidelityController cardController;

  @override
  Widget build(BuildContext context) {
    return VerticalScrollBehaviour(
      controller: cardController.scrollController,
      child: GetBuilder<FidelityController>(
        builder: (_) {
          if (cardController.cardItems.isNotEmpty) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                    cardController.cardItems.length,  
                    (index) {
                      final item = cardController.cardItems[index];

                      return CardItem(
                        path: item.imgurl!, 
                        name: item.name!, 
                        price: item.pointsPrice!, 
                        cardController: cardController,
                        index: index
                      );
                    },
                  )
                ),
                const SizedBox(height: 60)
              ],
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: EmptyCard()
            );
          }
        }
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.path,
    required this.name,
    required this.price,
    required this.cardController,
    required this.index
  });

  final String path;
  final String name;
  final int price;
  final FidelityController cardController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomColors.primaryBej
      ),
      child: Row(
        children: [
          Image.network(
            path,
            height: 60,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyles.style31.copyWith(
                          height: 0
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/cinema.svg'),
                          const SizedBox(width: 5),
                          Text(
                            price.toString(),
                            style: TextStyles.style32.copyWith(
                              height: 0
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CustomIconButton(
                  onPressed: () => cardController.deleteItem(index),
                  child: SvgPicture.asset('assets/icons/delete.svg'), 
                )
              ],
            )
          )
        ],
      ),
    );
  }
}