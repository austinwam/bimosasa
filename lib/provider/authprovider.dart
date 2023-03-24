import 'package:bimosasa/request/authapi.dart';
import 'package:flutter/material.dart';

class Authprovider with ChangeNotifier {
  bool? _isloading;

  bool? get isloading => _isloading;
  set isloading(bool? value) {
    _isloading = value;
    notifyListeners();
  }

  Future login(phone, password) async {
    isloading = true;
    Authapi().login(phone, password);
    isloading = false;
  }

  Future register(phone, password) async {
    isloading = true;
    Authapi().register(phone, password);
    isloading = false;
  }
}
