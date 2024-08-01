import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class TicketInfo extends StatelessWidget {
  const TicketInfo({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    required this.seats,
    required this.image
  });

  final String title,date,type;
  final List<String> seats;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.style13.copyWith(
                  color: CustomColors.black
                ),
              ),
              Text(
                type,
                style: TextStyles.style6.copyWith(
                  color: CustomColors.black
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seat',
                          style: TextStyles.style33,
                        ),
                        Text(
                          seats.join(','),
                          style: TextStyles.style6.copyWith(
                            color: CustomColors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hall Alpha',
                        style: TextStyles.style33,
                      ),
                      Text(
                        date,
                        style: TextStyles.style6.copyWith(
                          color: CustomColors.black
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const TicketDecoration(),
        Center(child: Image(image: image)),
        const SizedBox(height: 15),
      ],
    );
  }
}

class TicketDecoration extends StatelessWidget {
  const TicketDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)
            ),
            color: CustomColors.black2
          )
        ),
        Expanded(
          child: SvgPicture.asset('assets/images/dashed_line.svg'),
        ),
        Container(
          height: 40,
          width: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
            color: CustomColors.black2
          )
        ),
      ],
    );
  }
}