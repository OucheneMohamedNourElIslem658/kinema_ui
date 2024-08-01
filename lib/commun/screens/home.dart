import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/buttom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key, 
    required this.navigationShell
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: navigationShell,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtomNavBar(
              navigationShell: navigationShell,
            ),
          ),
        ],
      ),    
    );
  }
}