import 'package:flutter/material.dart';

import '../../../commun/constents/text_styles.dart';
import '../models/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key, 
    required this.properties,
    this.trailing
  });

  final Movie properties;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: properties.selectColor,
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 5
                ),
                decoration: BoxDecoration(
                  color: properties.backgroundColor,
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        properties.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.style4.copyWith(
                          color: properties.selectColor
                        ),
                      ),
                    ),
                    trailing ?? const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}