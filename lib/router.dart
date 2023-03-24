import 'package:bimosasa/pages/homepage.dart';
import 'package:bimosasa/pages/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'conrouter.dart';

class Approuter {
  final GoRouter router = GoRouter(
    initialLocation: AppPath.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: Apppages.homepage,
        path: AppPath.homepage,
        builder: (BuildContext context, GoRouterState state) {
          return const Homepage();
        },
      ),
          GoRoute(
        // name: Apppages.homepage,
        path: "/user",
        builder: (BuildContext context, GoRouterState state) {
          return const Userdetail();
        },
      ),
      //user detail
      GoRoute(
        // name: Apppages.homepage,
        path: "/user/:username",
        builder: (BuildContext context, GoRouterState state) {
          return const Userdetail();
        },
      ),
      GoRoute(
          name: Apppages.splash,
          path: AppPath.splash,
          builder: (BuildContext context, GoRouterState state) {
            return const Splashpage();
          }),
      GoRoute(
          name: Apppages.settingpage,
          path: AppPath.settingpage,
          builder: (BuildContext context, GoRouterState state) {
            return const Splashpage();
          }),
    ],
  );
}
