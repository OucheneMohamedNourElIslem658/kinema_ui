import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/utils/navigation_methods.dart';
import 'package:kinema/features/reservations/screens/seat_choice.dart';
import 'package:kinema/commun/models/movie.dart';

import '../controllers/show_hide_button.dart';
import '../widgets/description.dart';
import '../widgets/screen_with_shadow.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final showHideButtonController = Get.put(ShowHideButtonController());

    return Scaffold(
      body: GetBuilder<ShowHideButtonController>(
        builder: (_) {
          return ScreenWithShadow(
            backgroundImageURL: movie.picUrl,
            onGoBack: () => pop(context),
            showAppBar: true,
            onPayButtonPressed: () => push(
              context, 
              SeatChoiceScreen(
                movie: movie,
              )
            ),
            showPayButton: showHideButtonController.isScrollingUp,
            scrollController: showHideButtonController.scrollController,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  SizedBox(
                    width: double.maxFinite,
                    child: Description(
                      movie: movie,
                    ),
                  ),
                  const SizedBox(height: 70)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}