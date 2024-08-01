import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/widgets/payment_button.dart';
import 'package:kinema/features/reservations/screens/ticket.dart';
import 'package:kinema/commun/models/movie.dart';
import 'package:pay/pay.dart';

import '/commun/utils/navigation_methods.dart';
import '/commun/widgets/vertical_scroll_behaviour.dart';
import '../widgets/reservation_summery.dart';
import '/commun/constents/colors.dart';
import '../controllers/reservations.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/seats.dart';
import '../widgets/screen.dart';
import '../widgets/selected_hole_time.dart';

class SeatChoiceScreen extends StatefulWidget {
  const SeatChoiceScreen({
    super.key,
    required this.movie
  });

  final Movie movie;

  @override
  State<SeatChoiceScreen> createState() => _SeatChoiceScreenState();
}

class _SeatChoiceScreenState extends State<SeatChoiceScreen> {
  late String selectedTime;

  @override
  void initState() {
    selectedTime = getTimeRange(
      widget.movie.showTime[0],
      widget.movie.time 
    );
    super.initState();
  }

  String getTimeRange(DateTime dateTime, int minutesToAdd) {
    DateTime endDateTime = dateTime.add(Duration(minutes: minutesToAdd));
    String startTime =
        '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';
    String endTime =
        '${endDateTime.hour % 12 == 0 ? 12 : endDateTime.hour % 12}:${endDateTime.minute.toString().padLeft(2, '0')} ${endDateTime.hour >= 12 ? 'PM' : 'AM'}';
    return '$startTime - $endTime';
  }

  @override
  Widget build(BuildContext context) {
    final reservationController = Get.put(ReservationsController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: widget.movie.name,
        centertitle: true,
        showTitle: true,
        onGoBack: () {
          pop(context);
          Get.delete<ReservationsController>();
        },
      ),
      body: VerticalScrollBehaviour(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GetBuilder<ReservationsController>(
                builder: (_) {
                  return SelectedHoleTimes(
                    movie: widget.movie,
                    onHoleTimeChanged: (date, duration) 
                      => selectedTime = getTimeRange(date, duration),
                  );
                }
              ),
            ),
            const SizedBox(height: 40),
            const Screen(),
            const SizedBox(height: 30),
            Column(
              children: [
                GetBuilder<ReservationsController>(
                  builder: (_) {
                    return Seats(
                      reservationController: reservationController
                    );
                  }
                ),
                const SizedBox(height: 30),
                const SeatsStatus()
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ReservationSummery()
            ),
            const SizedBox(height: 20),
            const Spacer(),
            GetBuilder<ReservationsController>(
              builder: (_) {
                return reservationController.totalPrice == 0
                  ? const SizedBox()
                  : PaymentButton(
                    paymentItems: [
                      PaymentItem(
                        label: 'Total',
                        amount: reservationController.totalPrice.toString(),
                        status: PaymentItemStatus.final_price,
                      )
                    ],
                    onPaymentResult: (result) async {
                      if (kDebugMode) {
                        print(result);
                      }
                      reservationController.incrementScore();
                      reservationController.addReserVation(widget.movie);
                      push(
                        context, 
                        TicketScreen(
                          seats: reservationController.reservedPlaces,
                          movie: widget.movie,
                          range: selectedTime,
                        )
                      );
                    },
                  );
              }
            ),
            const Spacer(),
            const SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}