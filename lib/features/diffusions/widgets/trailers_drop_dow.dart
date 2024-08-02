import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/movie.dart';
import '/commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class TrailersDropdownMenu extends StatefulWidget {
  const TrailersDropdownMenu({
    super.key,
    required this.trailers
  });

  final List<Trailer> trailers;

  @override
  State<TrailersDropdownMenu> createState() => _TrailersDropdownMenuState();
}

class _TrailersDropdownMenuState extends State<TrailersDropdownMenu> {
  int? currentValue = 0;

  void changeValue(int? newValue) {
    setState(() {
      currentValue = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movie Trailer",
          style: TextStyles.style8,
        ),
        DropdownButton<int>(
          hint: const Text('Select a Movie'),
          value: currentValue,
          onChanged: (int? newValue) => changeValue(newValue),
          underline: const SizedBox(),
          itemHeight: 70,
          icon: SvgPicture.asset(
            "assets/icons/arrow_down.svg",
            width: 20,
          ),
          items: List.generate(
            widget.trailers.length, 
            (index) {
              final trailer = widget.trailers[index];
              return DropdownMenuItem<int>(
                value: index,
                child: TrailerItem(trailer: trailer)
              );
            }
          )
        ),
      ],
    );
  }
}

class TrailerItem extends StatelessWidget {
  const TrailerItem({
    super.key,
    required this.trailer,
  });

  final Trailer trailer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(trailer.thumbnailUrl),
                fit: BoxFit.fitWidth,
              )
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trailer.title,
                style: TextStyles.style5,
              ),

              trailer.isOriginal
              ? Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: CustomColors.blue1,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Original",
                    style: TextStyles.style5.copyWith(
                      color: CustomColors.blue1
                    ),
                  )
                ],
              )
              : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}