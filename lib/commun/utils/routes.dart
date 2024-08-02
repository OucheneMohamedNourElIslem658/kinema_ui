// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/features/diffusions/screens/diffusions.dart';
import '/features/reservations/screens/reservations.dart';
import '/screens/landing.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _diffusionsNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _reservationsNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _analyticsNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _feedbacksNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _fidelityNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _eventsNavigatorKey = GlobalKey<NavigatorState>();


final routes = <RouteBase>[
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return LandingScreen(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        navigatorKey: _homeNavigatorKey,
        routes: [
          GoRoute(
            path: "/home",
            builder: (acontext, state) => const Placeholder()
          )
        ]
      ),
      StatefulShellBranch(
        navigatorKey: _diffusionsNavigatorKey,
        routes: [
          GoRoute(
            path: "/diffusions",
            builder: (context, state) => const DiffusionsScreen()
          )
        ]
      ),
      StatefulShellBranch(
        navigatorKey: _reservationsNavigatorKey,
        routes: [
          GoRoute(
            path: "/reservations",
            builder: (context, state) => const ReservationsScreen(),
          )
        ]
      ),
      StatefulShellBranch(
        navigatorKey: _analyticsNavigatorKey,
        routes: [
          GoRoute(
            path: "/analytics",
            builder: (context, state) => const Placeholder(),
          )
        ]
      ),
      StatefulShellBranch(
        navigatorKey: _feedbacksNavigatorKey,
        routes: [
          GoRoute(
            path: "/feedbacks",
            builder: (context, state) => const Placeholder(),
          )
        ]
      ),
      StatefulShellBranch(
        navigatorKey: _fidelityNavigatorKey,
        routes: [
          GoRoute(
            path: "/fidelity",
            builder: (context, state) => const Placeholder(),
          )
        ]
      ),
      StatefulShellBranch(
        navigatorKey: _eventsNavigatorKey,
        routes: [
          GoRoute(
            path: "/events",
            builder: (context, state) => const Placeholder(),
          )
        ]
      ),
    ],
  ),
];