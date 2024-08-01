import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/widgets/vertical_scroll_behaviour.dart';
import 'package:kinema/commun/widgets/waiting_widget.dart';

import '../../../commun/controllers/program.dart';
import '../../../commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/categorie_items.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programController = Get.put(ProgramController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showBackButton: false,
        showTitle: true,
        title: 'This Week’s Program',
        space: 20,
      ),
      body: RefreshIndicator(
        color: CustomColors.primaryRed,
        backgroundColor: CustomColors.black,
        onRefresh: () async {
          await programController.getProgram();
        },
        child: VerticalScrollBehaviour(
          child: GetBuilder<ProgramController>(
            builder: (_) {
              if (programController.movies.isEmpty) {
                return const WaitingWidget();
              }
              return Column(
                children: [
                  const SizedBox(height: 20),
                  CategoriItems(
                    name: 'Action Movies',
                    movies: programController.movies,
                  ),
                  const SizedBox(height: 20),
                  CategoriItems(
                    name: 'Adventure Movies',
                    movies: programController.movies,
                  ),
                  const SizedBox(height: 20),
                  CategoriItems(
                    name: 'Crime Movies', 
                    movies: programController.movies
                  ),
                  const SizedBox(height: 70),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}