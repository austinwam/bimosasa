import 'package:bimosasa/data/userdata.dart';
import 'package:bimosasa/provider/provider.dart';
import 'package:flutter/material.dart';

class Userprovider with ChangeNotifier {
  List<Usermodel> _usermodel = [];

  List<Usermodel> get usermodel => _usermodel;

  set usermodel(List<Usermodel> value) {
    _usermodel = value;
    notifyListeners();
  }

  Usermodel? selectuser;

  void setuset(val) {
    selectuser = val;
    notifyListeners();
  }

  bool? _isloading;

  bool? get isloading => _isloading;

  set isloading(bool? value) {
    _isloading = value;
    notifyListeners();
  }

  Future<void> getusers() async {
    isloading = true;
    List<Usermodel> users = await Formatdata().user(userdata, true);
    print(users);
    usermodel = users;
    isloading = false;
  }
}
