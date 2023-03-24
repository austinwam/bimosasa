import 'package:bimosasa/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0ca88c),
      body: Consumer<Authprovider>(builder: (context, authdata, _) {
        if (authdata.isloading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                top: 10, left: 16.0, right: 16.0, bottom: 10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Recover Password",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                            "We will send the Confirmation Code to your phone\nPlease type your email below."),
                        const SizedBox(height: 20.0),
                        const TextField(
                          decoration: InputDecoration(hintText: "phone"),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              color: const Color(0xff0ca88c),
                              textColor: Colors.white,
                              child: Text("Recover".toUpperCase()),
                              onPressed: () {},
                            )),
                        const SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: Colors.grey.shade600,
                            )),
                            const SizedBox(width: 10.0),
                            const Text(
                              "Having problems?",
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                                child: Divider(
                              color: Colors.grey.shade600,
                            )),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          child: Text(
                            "Contact Us".toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  height: 100,
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
