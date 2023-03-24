import 'package:bimosasa/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'conrouter.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<Userprovider>(context, listen: false).getusers();
      Future.delayed(const Duration(seconds: 3), () {
    
        context.goNamed(AppPath.homepage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Icon(
              Icons.abc,
              size: 80,
            ),
          ),
        ],
      ),
    );
  }
}
