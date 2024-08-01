import 'dart:ui';

import 'package:flutter/material.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 40,
            top: 20
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1.2, 5.5),
                blurRadius: 12,
                color: Colors.black.withOpacity(0.33),
              )
            ]
          ),
          child: child
        ),
      ),
    );
  }
}