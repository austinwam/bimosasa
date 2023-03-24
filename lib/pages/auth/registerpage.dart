import 'package:bimosasa/utils/dataformat.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? phone, password, cpassword;
  final GlobalKey<FormState> _key = GlobalKey();
  bool? isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
                decoration: InputDecoration(
                    helperText:
                        phone != null ? "$phone" : "enter your phone nu. +254",
                    hintText: 'mobile +254'),
                initialValue: "+254",
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
                    const InputDecoration(hintText: ' confirm password'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: confirmpassword,
                onSaved: (String? val) {
                  cpassword = val;
                }),
          ],
        ),
      ),
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
