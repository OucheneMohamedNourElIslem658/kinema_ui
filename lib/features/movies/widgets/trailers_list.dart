import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/models/movie.dart';

import '/features/movies/controllers/popular_trailers.dart';
import 'package:video_player/video_player.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_video_player.dart';

class TrailersList extends StatelessWidget {
  const TrailersList({super.key});

  @override
  Widget build(BuildContext context) {
    final trailerController = Get.put(PopularTrailersController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Popular Trailers',
            style: TextStyles.style14.copyWith(
              color: CustomColors.white
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              GetBuilder<PopularTrailersController>(
                builder: (_) {
                  return Row(
                    children: List.generate(
                      trailerController.trailers.length, 
                      (index) {
                        final trailer = trailerController.trailers[index];
                        final controller = trailer['controller'] as VideoPlayerController?;
                        final movie = trailer['movie'] as Movie;
                        // final path = trailer['path'] as String;

                        if (controller == null) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomVideoPlayer(
                            width: 280,
                            borderRadius: 12,
                            title: movie.name,
                            showTitle: true,
                            controller: controller,
                          ),
                        );
                      }
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}