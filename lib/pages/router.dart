import 'package:bimosasa/pages/auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bimosasa/pages/homepage.dart';
import 'package:bimosasa/pages/splashpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/changepass.dart';
import 'auth/registerpage.dart';
import 'conrouter.dart';
import 'onboardpage.dart';

class Approuter {
  final GoRouter router = GoRouter(
    initialLocation: AppPath.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: Apppagename.homepage,
        path: AppPath.homepage,
        builder: (BuildContext context, GoRouterState state) {
          return const Homepage();
        },
      ),
// auth::login
      GoRoute(
        name: Apppagename.loginpage,
        path: AppPath.loginpage,
        builder: (BuildContext context, GoRouterState state) {
          return const Loginpage();
        },
      ),
      // register
      GoRoute(
        name: Apppagename.registerpage,
        path: AppPath.registerpage,
        builder: (BuildContext context, GoRouterState state) {
          return const Registerpage();
        },
      ),
      // password
      GoRoute(
        name: Apppagename.resetpassword,
        path: AppPath.resetpassword,
        builder: (BuildContext context, GoRouterState state) {
          return const Resetpasspage();
        },
      ),
      GoRoute(
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
          name: Apppagename.splash,
          path: AppPath.splash,
          builder: (BuildContext context, GoRouterState state) {
            return const Splashpage();
          }),
      GoRoute(
          name: Apppagename.settingpage,
          path: AppPath.settingpage,
          builder: (BuildContext context, GoRouterState state) {
            return const Splashpage();
          }),
      GoRoute(
        name: Apppagename.onbourding,
        path: AppPath.onbourding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingPage();
        },
      ),
    ],
    redirect: (context, state) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isfirstime = prefs.getBool('firsttime');
      if (isfirstime == null) {
        return AppPath.onbourding;
      }
      return null;
    },
  );
}

/*
states
1. onbouding
2. splash


isauth

completed auth
adduser
kyc

homepage


*/
enum Appstate { red, green, blue }
