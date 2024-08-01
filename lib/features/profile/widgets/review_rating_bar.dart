import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../controllers/reviews.dart';
import 'custom_rating_bar.dart';

class ReviewTextingBar extends StatelessWidget {
  const ReviewTextingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewsController = Get.put(ReviewsController());
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 85,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              color: CustomColors.black3,
            ),
            child: GetBuilder<ReviewsController>(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRatingBar(
                    rate: reviewsController.rate,
                    enableRate: true,
                    onUpdateRate: (p0) => reviewsController.updateRate(p0),
                  ),
                  TextFormField(
                    cursorColor: CustomColors.primaryBej,
                    controller: reviewsController.reviewContent,
                    style:
                        TextStyles.style33.copyWith(color: CustomColors.white),
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Leave your review...',
                        hintStyle: TextStyles.style33
                            .copyWith(color: CustomColors.primaryBej),
                        contentPadding: const EdgeInsets.all(0)),
                  )
                ],
              );
            }),
          ),
        ),
        SizedBox(
          height: 70,
          child: ElevatedButton(
              onPressed: () => reviewsController.addReview(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.greyText2,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)))),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: CustomColors.white,
              )),
        )
      ],
    );
  }
}
