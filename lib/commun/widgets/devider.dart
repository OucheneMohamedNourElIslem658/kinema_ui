import 'package:flutter/material.dart';

import '../constents/colors.dart';

class Devider extends StatelessWidget {
  const Devider({
    super.key,
    this.color
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 1,
      color: color ?? CustomColors.primaryBej,
    );
  }
}