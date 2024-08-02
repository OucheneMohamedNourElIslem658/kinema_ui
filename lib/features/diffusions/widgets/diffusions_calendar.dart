import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/confirmation_dialog.dart';

import '../models/movie.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/features/diffusions/controllers/diffusions.dart';
import '/features/diffusions/widgets/movie_item.dart';

import 'diffusion_calendar_search_bar.dart';

class DiffusionsCalendar extends StatelessWidget {
  const DiffusionsCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30
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
      child: Column(
        children: [
          const DiffusionCalendarSeachBar(
            halls: ["Alpha","Beta","Gamma","Theta"],
          ),
          const SizedBox(height: 20),
          buildDivider(),
          const SizedBox(height: 30),
          const Expanded(
            child: DiffusionsTable()
          )
        ],
      ),
    );
  }

  Container buildDivider() {
    return Container(
      width: double.maxFinite,
      height: 3,
      color: CustomColors.grey5,
    );
  }
}

class DiffusionsTable extends StatelessWidget {
  const DiffusionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final diffusionsController = Get.put(DiffusionsController());
    final schedule = diffusionsController.schedule;
    final slotsRanges = diffusionsController.slotsRanges;

    List<Widget> buildTableSlots({
      required List<String> slots,
    }) {
      final List<Widget> children = [];
      children.add(const SizedBox(width: 18));
      for (var i = 0; i < slots.length; i++) {
        children.add(
          Text(
            slots[i],
            style: TextStyles.style7,
          ),
        );
      }
      return children;
    }

    List<Widget> buildTableRow({
      required String day,
      required int slotsCount,
    }) {
      final List<Widget> cells = [];
      cells.add(
        Expanded(
          child: Text(
            day,
            style: TextStyles.style7,
          ),
        ),
      );

      for (var i = 0; i < slotsCount; i++) {
        cells.add(
          Expanded(
            child: DragTarget<Movie>(
              onAcceptWithDetails: (movieData) {
                diffusionsController.addDuffusion(
                  diffusionDay: day,
                  diffusionIndex: i,
                  movie: movieData.data
                );
              },
              builder: (context, candidateData, rejectedData) {
                final movie = schedule[day]![i];

                MovieItem? movieItem;
                if (movie != null) {
                  movieItem = MovieItem(
                    properties: movie,
                    trailing: InkWell(
                      onTap: () => showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        barrierDismissible: false,
                        builder: (context) => ConfirmationDialog(
                          onConfirm: () {
                            diffusionsController.removeDiffusion(
                              diffusionDay: day,
                              diffusionIndex: i
                            );
                            context.pop();
                          },
                          confirmMessage: "Delete",
                          title: "Are you sure you want to remove this diffusion?",
                          description: "If you remove this diffusion, it will no longer be visible on the website’s program.",
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: movie.selectColor,
                        size: 20,
                      ),
                    ),
                  );
                }

                if (candidateData.isNotEmpty) {
                  if (movie == null) {
                    return Container(
                      color: Colors.grey.withOpacity(0.2)
                    );
                  }
                  return movieItem!;
                } else {
                  return CustomCell(
                    movie: movie, 
                    column: i, 
                    isLastColumn: i == slotsCount - 1, 
                    movieItem: movieItem
                  );
                }
              },
            ),
          ),
        );
      }
      cells.add(const SizedBox(width: 40));
      return cells;
    }
    
    return GetBuilder<DiffusionsController>(
      builder: (_) {
        return Column(
          children: [
            for (var day in schedule.keys)
              Expanded(
                child: Row(
                  children: buildTableRow(
                    day: day, 
                    slotsCount: schedule[day]!.length
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buildTableSlots(slots: slotsRanges),
                ),
              ),
            )
          ],
        );
      }
    );
    
  }
}

class CustomCell extends StatelessWidget {
  const CustomCell({
    super.key,
    required this.movie,
    required this.column,
    required this.movieItem,
    required this.isLastColumn
  });

  final Movie? movie;
  final int column;
  final bool isLastColumn;
  final MovieItem? movieItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: movie?.backgroundColor,
        border: Border(
          left: movie == null
            ? BorderSide(
              width: 2,
              color: CustomColors.grey5,
            )
            : BorderSide.none,
          right: isLastColumn
              ? BorderSide(
                  width: 2,
                  color: CustomColors.grey5,
                )
              : BorderSide.none,
        ),
      ),
      child: movie != null
        ? movieItem
        : null
    );
  }
}