import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_elevated_button.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visit our website',
              style: TextStyles.style14
                  .copyWith(fontSize: 20, color: CustomColors.white),
            ),
            Text(
                'Explore movie magic! Visit our website for showtimes, about us, and more.',
                style: TextStyles.style25
                    .copyWith(color: CustomColors.greyText2, fontSize: 13)),
            const SizedBox(height: 20),
            CustomElevatedButton(
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/internet.svg'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text('kinema.com',
                          style: TextStyles.style3
                              .copyWith(overflow: TextOverflow.ellipsis)),
                    )
                  ],
                ))
          ],
        )),
        const SizedBox(width: 10),
        Image.asset('assets/images/laptop.png')
      ],
    );
  }
}
