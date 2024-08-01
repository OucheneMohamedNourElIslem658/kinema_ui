import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/controllers/program.dart';
import 'package:kinema/features/event/controllers/event.dart';
import 'package:kinema/features/event/screens/event.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/more_button.dart';
import '../../../commun/widgets/waiting_widget.dart';
import '../widgets/contact_us.dart';
import '/commun/widgets/custom_network_image.dart';

import '../../../commun/widgets/event_item.dart';
import '/features/movies/widgets/discription_tile.dart';
import '../widgets/categorie_list.dart';
import '../widgets/trailers_list.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/movies/screens/movie_selected.dart';
import '/features/movies/widgets/screen_with_shadow.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final eventController = Get.put(EventController());
    final programController = Get.put(ProgramController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      body: GetBuilder<ProgramController>(
        builder: (_) {
          if (programController.movies.isEmpty) {
            return const WaitingWidget();
          }
          return RefreshIndicator(
            backgroundColor: CustomColors.black,
            color: CustomColors.primaryRed,
            onRefresh: () async {
              await programController.getProgram();
              await eventController.getEvents();
            },
            child: ScreenWithShadow(
              backgroundImageURL: programController.movies.first.picUrl,
              showAppBar: false,
              showPayButton: false,
              shadowPadding: -0.5,
              child: SafeArea(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 350),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptionTile(movie: programController.movies.first,),
                          GestureDetector(
                            onTap: () => push(
                                context,
                                MovieScreen(
                                  movie: programController.movies.first,
                                )),
                            child: SvgPicture.asset(
                              'assets/icons/play.svg',
                              height: 42,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CategorieList(
                      movies: programController.movies.where(
                        (element) {
                          final showTime = element.showTime;
                          for (var element1 in showTime) {
                            final currentDate = DateTime.now();
                            if (
                              element1.day == currentDate.day &&
                              element1.month == currentDate.month &&
                              element1.year == currentDate.year
                            ) {
                              return true;
                            }
                          }
                          return false;
                        }
                      ).toList()
                    ),
                    const SizedBox(height: 15),
                    const TrailersList(),
                    const SizedBox(height: 15),
                    const SizedBox(
                      height: 230,
                      width: double.maxFinite,
                      child: CustomNetworkImage(
                          backgroundImageURL:
                              'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/snacks.png?alt=media&token=4126c18c-125c-4135-8951-55d1fc4c7f78'),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Upcoming Events',
                        style: TextStyles.style14.copyWith(color: CustomColors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<EventController>(
                      builder: (_) {
                        if (eventController.events.isEmpty) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: EventItem(
                            event: eventController.events.first,
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MoreButton(
                        onSeeMore: () => push(context, const EventScreen()),
                        text: 'More Events',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ContactUs(),
                    ),
                    const SizedBox(height: 70),
                  ],
                )
              )
            ),
          );
        }
      )
    );
  }
}