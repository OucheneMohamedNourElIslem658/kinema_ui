import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/features/auth/screens/auth.dart';
import '../screens/lost_connection.dart';
import '../screens/random_problem.dart';
import '/features/fidelity/screens/fidelity_market.dart';
import '/features/movies/screens/movies.dart';
import '/features/profile/screens/profile_settings.dart';
import '/features/program/screens/program.dart';
import '/features/trailers/screens/trailers.dart';
import '../screens/home.dart';

class CustomNavigation {
  CustomNavigation._();
  
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorMovies = GlobalKey<NavigatorState>(
    debugLabel: 'shellMovie'
  );

  static final _rootNavigatorProgram = GlobalKey<NavigatorState>(
    debugLabel: 'shellProgram'
  );

  static final _rootNavigatorTrailers = GlobalKey<NavigatorState>(
    debugLabel: 'shellTrailers'
  );

  static final _rootNavigatorFidelity = GlobalKey<NavigatorState>(
    debugLabel: 'shellFidelity'
  );

  static final _rootNavigatorProfileSettings = GlobalKey<NavigatorState>(
    debugLabel: 'shellProfileSettings'
  );

  static final routes = <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return  HomeScreen(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _rootNavigatorMovies,
          routes: [
            GoRoute(
              path: '/movies',
              name: 'Movies',
              builder: (context, state) {
                return MoviesScreen(
                  key: state.pageKey,
                );
              },
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorProgram,
          routes: [
            GoRoute(
              path: '/program',
              name: 'Program',
              builder: (context, state) {
                return ProgramScreen(
                  key: state.pageKey,
                );
              },
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorTrailers,
          routes: [
            GoRoute(
              path: '/trailers',
              name: 'Trailers',
              builder: (context, state) {
                return TrailersScreen(
                  key: state.pageKey,
                );
              },
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorFidelity,
          routes: [
            GoRoute(
              path: '/fidelity',
              name: 'Fidelity',
              builder: (context, state) {
                return FidelityMarketScreen(
                  key: state.pageKey,
                  showBackButton: false,
                );
              },
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorProfileSettings,
          routes: [
            GoRoute(
              path: '/profileSettings',
              name: 'ProfileSettings',
              builder: (context, state) {
                return ProfileSettingsScreen(
                  key: state.pageKey,
                );
              },
            )
          ]
        ),
      ]
    ),
    GoRoute(
      path: '/Auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/Lost',
      builder: (context, state) => const LostConnectionScreen(),
    ),
    GoRoute(
      path: '/Random',
      builder: (context, state) => const RandomProblemScreen(),
    ),
  ];
}