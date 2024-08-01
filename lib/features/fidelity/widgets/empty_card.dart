import 'package:flutter/material.dart';
import '../../../commun/widgets/indication.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Indication(
      imagePath: 'assets/images/empty_card.svg',
      description: 'Your card is empty, check what we have in stock!',
    );
  }
}