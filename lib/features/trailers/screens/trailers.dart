import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/controllers/program.dart';
import 'package:kinema/commun/widgets/waiting_widget.dart';
import 'package:kinema/commun/models/movie.dart';
import 'package:video_player/video_player.dart';

import '../widgets/trailer.dart';
import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';

class TrailersScreen extends StatelessWidget {
  const TrailersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programController = Get.put(ProgramController());

    return Scaffold(
      appBar: customAppBar(
        showTitle: true,
        title: 'Trailers',
        showBackButton: false
      ),
      backgroundColor: CustomColors.black2,
      body: GetBuilder<ProgramController>(
        builder: (_) {
          if (programController.trailers.isEmpty) {
          return const WaitingWidget();
        }
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    programController.trailers.length, 
                    (index) {
                      final trailer = programController.trailers[index];
                      final movie = trailer['movie'] as Movie;
                      final controller = trailer['controller'] as VideoPlayerController?;
                      
                      if (controller == null) {
                        return const SizedBox();
                      }
                          
                      return Trailer(
                        movie: movie,
                        controller: controller,
                      );
                    },
                  )
                ),
                const SizedBox(height: 50)
              ],
            ),
          );
        }
      ),
    );
  }
}