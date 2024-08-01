// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../controllers/reservations.dart';

class Seats extends StatelessWidget {
  const Seats({
    super.key,
    required this.reservationController,
  });

  final ReservationsController reservationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        reservationController.seats.length, 
        (index1) {
          final row = reservationController.seats[index1];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: List.generate(
                        row.length,
                        (index2) {
                          final seatStatus = row[index2];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index2 == 1 || index2 == 9 ? 18 : 7
                            ),
                            child: GestureDetector(
                              onTap: () => reservationController.reserveSeat(index1, index2),
                              child: SvgPicture.asset(
                                'assets/icons/seat.svg',
                                color: seatStatus == SeatStatus.available 
                                  ? CustomColors.white 
                                  : seatStatus == SeatStatus.selected 
                                    ? CustomColors.primaryRed 
                                    : CustomColors.black4,
                              ),
                            )
                          );
                        }
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    String.fromCharCode(index1 + 65),
                    style: TextStyles.style12.copyWith(
                      color: CustomColors.greyText2
                    ),
                  )
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}

class SeatsStatus extends StatelessWidget {
  const SeatsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        statusItem(
          title: 'Available',
          color: CustomColors.white
        ),
        const SizedBox(width: 15),
        statusItem(
          title: 'Blocked', 
          color: CustomColors.black4
        ),
        const SizedBox(width: 15),
        statusItem(
          title: 'Selected', 
          color: CustomColors.primaryRed
        ),
      ]
    );
  }

  Row statusItem({
    required String title, 
    required Color color
  }) {
    return Row(
        children: [
          SvgPicture.asset(
            'assets/icons/seat.svg',
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyles.style16.copyWith(
              color: CustomColors.white
            ),
          )
        ],
      );
  }
}