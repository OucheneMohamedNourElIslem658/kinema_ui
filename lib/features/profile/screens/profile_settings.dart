import 'package:flutter/material.dart';

import '../widgets/pionts_tile.dart';
import '../widgets/profile_tile.dart';
import '../widgets/settings.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../../../commun/constents/colors.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showBackButton: false,
        title: 'Profile',
        showTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              ProfileTile(),
              SizedBox(height: 20),
              PointsTile(),
              SizedBox(height: 20),
              Settings(),
              SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}