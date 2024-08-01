import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DottedBorder(
          strokeWidth: 3,
          dashPattern: const [6,4],
          color: CustomColors.grey4,
          child: SizedBox(
            height: 270,
            width: 180,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/picture.svg",
                    width: 65,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Movie Poster",
                    style: TextStyles.style1.copyWith(
                      color: CustomColors.grey4
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: (){}, 
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/upload.svg",height: 18),
              const SizedBox(width: 5),
              Text(
                "Upload New Picture",
                style: TextStyles.style5.copyWith(
                  color: CustomColors.blue1,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}