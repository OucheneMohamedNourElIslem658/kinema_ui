import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kinema/commun/models/movie.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/utils/navigation_methods.dart';
import '../../../commun/widgets/custom_network_image.dart';
import '../../../commun/widgets/imdb_rate.dart';
import '../screens/movie_selected.dart';

class CategorieList extends StatelessWidget {
  const CategorieList({
    super.key,
    required this.movies
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Diffusing Today',
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
              Row(
                children: List.generate(
                  movies.length,
                  (index) {
                    final movie = movies[index];
                    return GestureDetector(
                      onTap: () =>  push(context, MovieScreen(movie: movie)),
                      child: Stack(
                        children: [
                          Container(
                            height: 184,
                            width: 128,
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  CustomNetworkImage(
                              backgroundImageURL: movie.picUrl,
                              shimmerBorderRadius: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: IMDBRate(
                                rate: movie.rate,
                                fontSize: 7,
                                paddingHor: 12,
                                paddingVer: 6,
                                borderRadius: 6,
                            ),
                          ),
                        ]
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}