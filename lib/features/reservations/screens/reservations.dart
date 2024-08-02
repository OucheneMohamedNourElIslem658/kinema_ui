import 'package:flutter/material.dart';
import 'package:kinema_dashboard/commun/widgets/custom_appbar.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            getCustomAppBar(
              context, title: "Reservations"
            )
          ];
        }, 
        body: const Placeholder()
      ),
    );
  }
}