import 'package:flutter/material.dart';
import 'package:kinema/commun/widgets/indication.dart';

import '../constents/colors.dart';

class LostConnectionScreen extends StatelessWidget {
  const LostConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.black2,
      body: Indication(
        imagePath: 'assets/images/lost_connection.svg', 
        description: 'We couldn’t load this page :( \nCheck your internet connection',
        topFlex: 1,
        bottomFlex: 1,
      ),
    );
  }
}