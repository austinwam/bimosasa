import 'package:bimosasa/pages/conrouter.dart';
import 'package:bimosasa/provider/provider.dart';
import 'package:bimosasa/utils/dataformat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> _key = GlobalKey();

  String? phone, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00645d),
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
                  margin: const EdgeInsets.only(top: 60),
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white),
                  child: SingleChildScrollView(
                      child: Form(
                    key: _key,
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Welcome back to bimocash",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                helperText: phone != null
                                    ? "$phone"
                                    : "enter your phone nu. 254",
                                hintText: 'mobile 254'),
                            keyboardType: TextInputType.phone,
                            validator: validatephone,
                            onChanged: (phonev) async {
                              var sphone = await Dataformat().formphone(phonev);
                              setState(() {
                                phone = sphone;
                              });
                            },
                            onSaved: (String? val) {
                              phone = val;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'password'),
                            keyboardType: TextInputType.multiline,
                            obscureText: true,
                            validator: validatepassword,
                            onSaved: (String? val) {
                              password = val;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            width: double.infinity,
                            child: MaterialButton(
                                color: Colors.yellow,
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    _key.currentState!.save();
                                    authdata.login(phone, password);
                                  } else {}
                                },
                                child: Text("Login".toUpperCase()))),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          child: Text(
                            "Forgot Password".toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            context.goNamed(Apppagename.resetpassword);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: Colors.grey.shade600,
                            )),
                            const SizedBox(width: 10.0),
                            Text(
                              "Not a member?",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                                child: Divider(
                              color: Colors.grey.shade600,
                            )),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        InkWell(
                          child: SizedBox(
                            width: double.infinity,
                            height: 35,
                            child: Center(
                              child: Text(
                                "Create Account".toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          onTap: () {
                            context.goNamed(Apppagename.registerpage);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const Registerpage()),
                            // );
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  )),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  String? validatepassword(String? value) {
    if (value!.isEmpty) {
      return "password is Required";
    }
    return null;
  }

  String? validatephone(String? value) {
    if (value!.isEmpty) {
      return "phone is Required";
    }
    return null;
  }
}
