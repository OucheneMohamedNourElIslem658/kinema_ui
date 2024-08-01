import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/models/movie.dart';

import '/commun/widgets/custom_network_image.dart';
import '../controllers/reservations.dart';
import '/commun/utils/navigation_methods.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/custom_icon_button.dart';
import '/commun/widgets/download_button.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/ticket_info.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({
    super.key,
    this.showCancel = true, 
    required this.movie, 
    required this.seats,
    required this.range
  });

  final bool showCancel;
  final Movie movie;
  final List<String> seats;
  final String range;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showTitle: true,
        title: 'Your Ticket!',
        onGoBack: () {
          pop(context);
        },
        actions: showCancel 
          ? [
              CustomIconButton(
                child: SvgPicture.asset(
                  'assets/icons/delete.svg',
                  // ignore: deprecated_member_use
                  color: CustomColors.white,
                ), 
                onPressed: () {
                  pop(context);
                  pop(context);
                  Get.delete<ReservationsController>();
                }
              )
            ]
          : null
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CustomColors.primaryBej,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ticket(
                      imageURL: movie.picUrl,
                    ),
                    const SizedBox(height: 20),
                    TicketInfo(
                      title: movie.name, 
                      date: range, 
                      type: movie.type, 
                      seats: seats, 
                      image: const AssetImage('assets/images/barcode.png')
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You’ll receive this ticket on your email as well',
                style: TextStyles.style30.copyWith(
                  color: CustomColors.greyText3
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: DownloadButton(
                  onPressed: (){}
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
    required this.imageURL
  });

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 344,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: CustomNetworkImage(
        backgroundImageURL: imageURL,
        shimmerBorderRadius: 12,
        isJustTopRadius: true,
      ),
    );
  }
}