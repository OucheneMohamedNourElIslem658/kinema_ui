import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../controllers/reviews.dart';
import 'custom_rating_bar.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reviewsController = Get.put(ReviewsController());

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What our customers think',
            style: TextStyles.style3,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GetBuilder<ReviewsController>(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    List.generate(reviewsController.reviews.length, (index) {
                  final review = reviewsController.reviews[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              review.reviewer,
                              style: TextStyles.style27,
                            ),
                            const SizedBox(width: 5),
                            CustomRatingBar(rate: review.rate)
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          review.review,
                          style: TextStyles.style29,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            review.time,
                            style: TextStyles.style29
                                .copyWith(color: CustomColors.greyText3),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
