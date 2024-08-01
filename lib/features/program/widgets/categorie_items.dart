import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '/commun/widgets/custom_network_image.dart';
import '../../../commun/models/movie.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/movies/screens/movie_selected.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/imdb_rate.dart';

class CategoriItems extends StatelessWidget {
  const CategoriItems({
    super.key,
    required this.name,
    required this.movies
  });

  final String name;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            name,
            style: TextStyles.style14.copyWith(
              color: CustomColors.primaryBej
            ),
          ),
        ),
        const SizedBox(height: 15),
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
                    return MovieItem(
                      movie: movie,
                    );
                  }
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key, 
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => push(context, MovieScreen(movie: movie)),
        child: SizedBox(
          width: 163,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 230,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomNetworkImage(
                      backgroundImageURL: movie.picUrl,
                      shimmerBorderRadius: 8,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: CustomColors.black7,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/icons/clock.svg'),
                          const SizedBox(width: 5),
                          Text(
                            "${movie.time} min",
                            style: TextStyles.style29,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            movie.name,
                            style: TextStyles.style6.copyWith(
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                        IMDBRate(
                          rate: movie.rate,
                          fontSize: 7,
                          borderRadius: 6,
                          paddingHor: 8,
                          paddingVer: 5,
                        )
                      ],
                    ),
                  ),
                  Text(
                    movie.type,
                    style: TextStyles.style28
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}