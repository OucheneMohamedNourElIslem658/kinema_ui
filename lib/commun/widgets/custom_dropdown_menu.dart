import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    this.label,
    required this.items,
    this.enableSearch = true,
    this.initialSelection,
    this.borderColor,
    this.borderThikness
  });

  final String? label;
  final List<String> items;
  final bool enableSearch;
  final int? initialSelection;
  final Color? borderColor;
  final double? borderThikness;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: borderThikness ?? 3,
        color: borderColor ?? CustomColors.grey4
      ),
      borderRadius: BorderRadius.circular(8)
    );

    return DropdownMenu(
      label: label != null ? Text(label!) : null,
      enableSearch: enableSearch,
      width: 170,
      textStyle: TextStyles.style5,
      initialSelection: initialSelection,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        labelStyle: TextStyles.style4.copyWith(
          color: CustomColors.grey4
        ),
      ),
      trailingIcon: SvgPicture.asset(
        "assets/icons/arrow_down.svg",
        width: 18,
      ),
      selectedTrailingIcon: SvgPicture.asset(
        "assets/icons/arrow_up.svg",
        width: 18,
      ),
      menuStyle: const MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.white
        ),
        side: WidgetStatePropertyAll(
          BorderSide.none
        )
      ),
      dropdownMenuEntries: List.generate(
        items.length, 
        (index) => DropdownMenuEntry(
          value: index, 
          label: items[index],
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyles.style5)
          )
        )
      )
    );
  }
}