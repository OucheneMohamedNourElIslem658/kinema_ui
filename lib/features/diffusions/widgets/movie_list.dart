import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:kinema_dashboard/commun/constents/text_styles.dart';
import 'package:kinema_dashboard/features/diffusions/controllers/diffusions.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/confirmation_dialog.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/movie_preview_dialog.dart';

import '../models/movie.dart';
import 'movie_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    final diffusionsController = Get.put(DiffusionsController());
    final movies = diffusionsController.movies;

    return Container(
      height: 530,
      width: double.maxFinite,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: 15
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 1),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),

      child: GetBuilder<DiffusionsController>(
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    controller: diffusionsController.moviesScrollController,
                    child: Column(
                      children: List.generate(
                          movies.length,
                          (index) {
                            final movie = movies[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index != 0 ? 15 : 0
                              ),
                              child: Draggable<Movie>(
                                data: movie,
                                feedback: MovieItem(
                                  properties: movie
                                ),
                                child: MovieItem(
                                  properties: movies[index],
                                  trailing: MovieEditPopupOption( 
                                    color: movie.selectColor, 
                                    onView: () => showDialog(
                                      context: context,
                                      barrierColor: Colors.transparent,
                                      builder: (context) => const MoviePreviewDialog(),
                                    ),
                                    onDelete: () => showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      barrierColor: Colors.transparent,
                                      builder: (context) => ConfirmationDialog(
                                        onConfirm: () {
                                          diffusionsController.removeMovie(index);
                                          context.pop();
                                        },
                                        confirmMessage: "Delete",
                                        title: "Are you sure you want to remove this movie?",
                                        description: "If you remove this movie, it will no longer be visible on the dashboard’s movies.",
                                      ),
                                    ),
                                  )
                                ),
                              ),
                            );
                          },  
                        ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          
              if (!diffusionsController.isScrollOffsetMaximum) 
                SvgPicture.asset("assets/icons/list_arrow_down.svg",width: 50) 
              else 
                const SizedBox()
            ],
          );
        }
      ),
    );
  }
}

class MovieEditPopupOption extends StatelessWidget {
  const MovieEditPopupOption({
    super.key, 
    required this.color, 
    required this.onView,
    required this.onDelete
  });

  final Color color;
  final VoidCallback onDelete;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      color: Colors.white,
      tooltip: "",
      child: Icon(
        Icons.more_vert,
        color: color,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: onView,
          child: Text(
            "View",
            style: TextStyles.style5,
          )
        ),
        PopupMenuItem(
          onTap: onDelete,
          child: Text(
            "Delete",
            style: TextStyles.style5,
          )
        )
      ],
    );
  }
}