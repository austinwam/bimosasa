import 'package:bimosasa/utils/sharepref.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';

import 'conrouter.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  // https://assets7.lottiefiles.com/packages/lf20_1AjvICqJwu.json
// https://assets9.lottiefiles.com/packages/lf20_ThvK64inTu.json
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to bimosasa finance",
      "image": "https://assets9.lottiefiles.com/packages/lf20_ThvK64inTu.json"
    },
    {
      "text":
          "We help people with low Cost, Secure Transactions and with Financial Services.",
      "image": "https://assets7.lottiefiles.com/packages/lf20_1AjvICqJwu.json"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]["image"],
                      text: splashData[index]['text'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      children: <Widget>[
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        const Spacer(flex: 3),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: MaterialButton(
                            minWidth: 95.w,
                            height: 5.h,
                            color: Colors.yellow,
                            child: const Text("Continue"),
                            onPressed: () {
                              Storedata().adddata(
                                  Kind.abool.text, Data.firsttime.text, false);
                              context.goNamed(Apppagename.splash);
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "bimocash".toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Spacer(flex: 4),
        Text(
          text!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(flex: 2),
        Lottie.network(
          image!,
          height: 50.h,
          width: 60.w,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
