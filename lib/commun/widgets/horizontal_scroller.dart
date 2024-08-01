import 'package:flutter/material.dart';

class HorizontalScroller extends StatelessWidget {
  const HorizontalScroller({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth
            ),
            child: IntrinsicWidth(
              child: child
            ),
          ),
        );
      }
    );
  }
}