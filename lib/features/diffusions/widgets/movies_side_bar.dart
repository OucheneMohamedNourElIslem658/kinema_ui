import 'package:flutter/material.dart';
import 'package:kinema_dashboard/features/diffusions/widgets/add_movie_dialog.dart';

import 'add_movie_button.dart';
import 'movie_list.dart';

class MoviesSideBar extends StatelessWidget {
  const MoviesSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: IntrinsicWidth(
        child: Column(
          children: [
            AddMovieButton(
              onPressed: () => showDialog(
                context: context,
                barrierColor: Colors.transparent,
                barrierDismissible: true,
                builder: (context) {
                  return const AddMovieDialogBox();
                }
              ),
            ),
            const SizedBox(height: 15),
            const MovieList()
          ],
        ),
      ),
    );
  }
}