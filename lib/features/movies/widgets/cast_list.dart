import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '/commun/widgets/custom_network_image.dart';
import '../../../commun/constents/text_styles.dart';

class CastList extends StatefulWidget {
  const CastList({
    super.key,
    required this.cast
  });

  final List<String> cast;

  @override
  State<CastList> createState() => _CastListState();
}

class _CastListState extends State<CastList> {
  late String chosenActor;

  @override
  void initState() {
    chosenActor = widget.cast[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index,reason) => setState(() {
                chosenActor = widget.cast[index];
              }),
              viewportFraction: 0.15,
              enlargeCenterPage: true,
              enlargeFactor: 0.2
            ),
            items: List.generate(
              widget.cast.length, 
              (index) {
                //this variable to take actor url
                // final actor = widget.cast[index];
                return Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: const CustomNetworkImage(
                      backgroundImageURL: 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg',
                      shape: BoxShape.circle,
                    )
                  ),
                );
              }
            ),
          )
        ),
        const SizedBox(height: 8),
        Text(
          chosenActor,
          style: TextStyles.style20,
        )
      ],
    );
  }
}
