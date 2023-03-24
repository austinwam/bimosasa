import 'package:bimosasa/provider/provider.dart';
import 'package:bimosasa/utils/dataformat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? phone, password, cpassword;
  final GlobalKey<FormState> _key = GlobalKey();
  bool? isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Authprovider>(builder: (context, authdata, _) {
        if (authdata.isloading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          helperText: phone != null
                              ? "$phone"
                              : "enter your phone nu. 254",
                          hintText: 'mobile 254'),
                      initialValue: "254",
                      keyboardType: TextInputType.phone,
                      validator: validateMobile,
                      onChanged: (phonev) async {
                        var sphone = await Dataformat().formphone(phonev);
                        setState(() {
                          phone = sphone;
                        });
                      },
                      onSaved: (String? val) {
                        phone = val;
                      }),
                  const SizedBox(height: 15.0),
                  TextFormField(
                      decoration: const InputDecoration(hintText: 'password'),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: validatepassword,
                      onSaved: (String? val) {
                        password = val;
                      }),
                  const SizedBox(height: 15.0),
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'confirm password'),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: confirmpassword,
                      onSaved: (String? val) {
                        cpassword = val;
                      }),
                  const SizedBox(height: 15.0),
                  MaterialButton(
                      minWidth: 90.w,
                      color: Colors.yellow,
                      child: Text("signup".toUpperCase()),
                      onPressed: () {})
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  String? validatepassword(String? value) {
    if (value!.isEmpty) {
      return "password is Required";
    } else if (value.length == 6) {
      return "password is to short";
    }
    return null;
  }

  String? confirmpassword(String? value) {
    if (value!.isEmpty) {
      return "password confirm is Required";
    } else if (password != cpassword) {
      return "password does not match";
    } else if (password == cpassword) {
      return null;
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return "Mobile is Required";
    }

    return null;
  }
}
