import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

AppBar customAppBar({
  String? title,
  bool centertitle = false,
  bool showTitle = false,
  bool showBackButton = true,
  VoidCallback? onGoBack,
  double? space,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: CustomColors.transparent,
    automaticallyImplyLeading: false,
    leading: showBackButton
      ? IconButton(
        onPressed: onGoBack ?? (){},
        icon: SvgPicture.asset('assets/icons/arrow_back_ios.svg')
      )
      : null,
    title: showTitle
      ? Text(
        title ?? 'My Reservations',
        style: TextStyles.style2.copyWith(
          color: CustomColors.white
        ),
      )
      : const SizedBox(),
    centerTitle: centertitle,
    actions: actions,
  );
}