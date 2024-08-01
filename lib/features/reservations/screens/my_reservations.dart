import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/utils/date_formats.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/reservations/screens/ticket.dart';
import '../../../commun/constents/colors.dart';
import '../widgets/reservation_card.dart';
import '../controllers/reservations.dart';
import '../widgets/custom_appbar.dart';

class MyReservationsScreen extends StatelessWidget {
  const MyReservationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reservationsController = Get.put(ReservationsController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showTitle: true,
        onGoBack: () => pop(context),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
        child: GetBuilder<ReservationsController>(
          builder: (_) {
            return ListView.builder(
              itemCount: reservationsController.reservations.length,
              itemBuilder:(context, index) {
                final reservation = reservationsController.reservations[index];
                return GestureDetector(
                  onTap: () => push(
                    context,
                    TicketScreen(
                      showCancel: false,
                      movie: reservation,
                      seats: const ['G4', 'G3', 'G8', 'G9'],
                      range: getTimeRange(reservation.showTime.first, reservation.time),
                    )
                  ),
                  child: ReservationCard(
                    imageURL: reservation.picUrl, 
                    movie: reservation.name, 
                    date: formatDateTime1(reservation.showTime.first), 
                    type: reservation.type, 
                    startsAfter: reservation.time.toString(), 
                    rate: reservation.rate,
                    onCancel: () => reservationsController.cancelReservation(index),
                  ),
                );
              },
            );
          }
        ),
      )
    );
  }
}