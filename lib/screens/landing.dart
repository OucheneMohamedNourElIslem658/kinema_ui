import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinema_dashboard/commun/constents/colors.dart';
import 'package:kinema_dashboard/commun/widgets/drawer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey2,
      body: Row(
        children: [
          CustomDrawer(
            currentIndex: widget.navigationShell.currentIndex,
            onTap: (index) => widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            ),
            onToggleDrawer: () => setState(() {
              isExpanded = !isExpanded;
            }),
            isExpanded: isExpanded,
          ),
          Expanded(
            child: widget.navigationShell
          )
        ],
      ),
    );
  }
}