import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'commun/utils/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: "/diffusions",
        navigatorKey: rootNavigatorKey,
        routes: routes
      ),
    );
  }
}