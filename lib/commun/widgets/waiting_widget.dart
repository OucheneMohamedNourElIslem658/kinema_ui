import 'package:flutter/material.dart';

import '../constents/colors.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: CustomColors.primaryRed,
    ));
  }
}
