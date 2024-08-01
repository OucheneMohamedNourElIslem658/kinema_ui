import 'package:flutter/material.dart';

import '/features/diffusions/widgets/diffusions_calendar.dart';
import '../../../commun/widgets/custom_appbar.dart';
import '../widgets/movies_side_bar.dart';

class DiffusionsScreen extends StatelessWidget {
  const DiffusionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            getCustomAppBar(
              context,
              title: "Diffusing"
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LayoutBuilder(
            builder: (context,con) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: con.maxWidth - 300,
                          constraints: const BoxConstraints(minWidth: 700),
                          child: const DiffusionsCalendar()
                        ),
                        const SizedBox(width: 30),
                        const MoviesSideBar(),
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}