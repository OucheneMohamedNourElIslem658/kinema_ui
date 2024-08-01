import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_dropdown_menu.dart';

class LanguageDropdownMenu extends StatelessWidget {
  const LanguageDropdownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Language",
          style: TextStyles.style8,
        ),
        const SizedBox(height: 5),
        CustomDropdownMenu(
          initialSelection: 3,
          items: const ["English","French","Arabic","Original"],
          enableSearch: false,
          borderColor: CustomColors.grey1,
          borderThikness: 2,
        ),
      ],
    );
  }
}