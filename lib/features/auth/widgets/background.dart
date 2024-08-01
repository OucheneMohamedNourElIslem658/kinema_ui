import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 30),
    required this.child
  });

  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: padding,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment(0,-1.4),
          colors: [
            CustomColors.black,
            CustomColors.black1
          ]
        )
      ),
      child: child,
    );
  }
}