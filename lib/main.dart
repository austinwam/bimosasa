import 'package:bimosasa/provider/provider.dart';
import 'package:bimosasa/provider/userprovider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

import 'pages/router.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Userprovider()),
        ChangeNotifierProvider(create: (_) => Authprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'bimosasa',
          theme: ThemeData(
            primaryColor: Colors.black54,
            appBarTheme:
                const AppBarTheme(color: Color.fromARGB(137, 176, 47, 47)),
          ),
          routerConfig: Approuter().router,
        );
      },
    );
  }
}
