import 'package:flutter/material.dart';

class VerticalScrollBehaviour extends StatelessWidget {
  const VerticalScrollBehaviour({
    super.key,
    required this.child,
    this.controller
  });

  final Widget child;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return SingleChildScrollView(
          controller: controller,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight
            ),
            child: IntrinsicHeight(
              child: child
            ),
          ),
        );
      }
    );
  }
}