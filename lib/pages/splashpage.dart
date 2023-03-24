import 'package:bimosasa/provider/userprovider.dart';
import 'package:bimosasa/utils/sharepref.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isauth = prefs.getBool('isauth');
      var isfirsttime = await Storedata().getdata(bool, Data.firsttime.text);
      Future.delayed(const Duration(seconds: 3), () {
        if (isauth == null || isauth == false) {
          if (isfirsttime == true) {
            context.goNamed(Apppagename.loginpage);
          } else {
            context.goNamed(Apppagename.registerpage);
          }
        } else {
          context.goNamed(AppPath.homepage);
        }
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
