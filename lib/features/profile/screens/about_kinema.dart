import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../controllers/reviews.dart';
import '../widgets/review_rating_bar.dart';
import '../widgets/reviews_list.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/features/movies/widgets/screen_with_shadow.dart';

class AboutKinema extends StatelessWidget {
  const AboutKinema({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewsController = Get.put(ReviewsController());
    return Scaffold(
      backgroundColor: CustomColors.black2,
      body: ScreenWithShadow(
        backgroundImageURL: 'https://s3-alpha-sig.figma.com/img/9210/75f0/dc7575d8a8f2fef2d48c3b71d1fd5eb4?Expires=1715558400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Qcrtjcdw~dRh4C-xHxNv~lMYUFxEDeLsHXm423djsZsvHaK~YEcSIgxqK18AIF621dGeRHffJ49QgKu1hANiAH3jklfpoygF7sF7iPllS~ZTQazYda1MSXYsHq0wApQOFCjVIYOUVapGMGg4A1ebTF8FZDUpO1f8Vdfxpvqmu-3ioJCQkGDxmq-zmYbhPVfa2JEliqRn6tysoknKwB5YEBvE-dkWLhM3tej46YK2gWnNcqOrAGR~gMeAUXzkR5Y-EWWiJ4K2U7WqTe4ZpCrE3uoZvzQP9QbFTCnzXbrdEj4pvaBI4eCtPTnLZQMv9k4T8ZsT0gA0bhi0Se2AwpCJ~A__',
        showPayButton: false,
        showAppBar: true,
        scrollController: reviewsController.scrollController,
        appBar: customAppBar(
          showTitle: true,
          title: 'About Kinema',
          onGoBack: () => pop(context)
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 200),
                  Text(
                    'Sit back and... Action!',
                    style: TextStyles.style3,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome to Kinema in Algiers, your premier destination for the latest movies and a top-notch cinematic experience. Our cinema features state-of-the-art screening halls, including advanced 3D technology, designed to immerse you in the world of film. We offer convenient online ticket booking and a loyalty program that rewards you with gifts and exclusive discounts. Join us at Kinema, where every film night is an unforgettable experience in the heart of the city.',
                    style: TextStyles.style40,
                  ),
                  const SizedBox(height: 20),
                  const ReviewsList(),
                  const ReviewTextingBar(),
                  const SizedBox(height: 70)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}