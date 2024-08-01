import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomTextLoader extends StatelessWidget {
  const CustomTextLoader(
      {super.key,
      required this.height,
      required this.width,
      this.borderRadius = 3});

  final double height, width, borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: height, maxWidth: width),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(borderRadius)),
    )
        .animate(onComplete: (controller) => controller.repeat())
        .shimmer(duration: const Duration(seconds: 1));
  }
}
