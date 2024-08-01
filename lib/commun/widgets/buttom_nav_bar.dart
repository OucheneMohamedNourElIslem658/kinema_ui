import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../features/movies/controllers/buttom_nav_bar.dart';
import '../constents/colors.dart';
import '../constents/text_styles.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({
    super.key, 
    required this.navigationShell
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Get.put(ButtomNavBarContoller());

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: CustomColors.black,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25)
        ),
        border: Border.all(
          color: CustomColors.greyBorder1.withOpacity(0.2)
        )
      ),
      child: GetBuilder<ButtomNavBarContoller>(
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomNavController.options.length, 
              (index) {
                final option = bottomNavController.options[index];
                final title = option['title'] as String;
                final icon = option['icon'] as String;
                final isSelected = option['isSelected'] as bool;
                return GestureDetector(
                  onTap: () => bottomNavController.selectOption(index,navigationShell),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          boxShadow: isSelected 
                            ? [
                              BoxShadow(
                                color: CustomColors.primaryRed.withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 18
                              )
                            ]
                            : null,
                          shape: BoxShape.circle
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            icon,
                            // ignore: deprecated_member_use
                            color: isSelected
                              ? CustomColors.primaryRed
                              : CustomColors.greyText2,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            title,
                            style: TextStyles.style21.copyWith(
                              color: isSelected
                                ? CustomColors.primaryRed
                                : CustomColors.greyText2
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
            ),
          );
        }
      ),
    );
  }
}