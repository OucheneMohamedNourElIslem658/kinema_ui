import 'package:flutter/material.dart';
import 'package:kinema/commun/constents/colors.dart';
import 'package:kinema/commun/widgets/indication.dart';

class RandomProblemScreen extends StatelessWidget {
  const RandomProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.black2,
      body: Indication(
        imagePath: 'assets/images/discover.svg', 
        description: 'There seems to be a problem,restart the app, if not solved, senda feedback!',
        topFlex: 1,
        bottomFlex: 1,
      ),
    );
  }
}