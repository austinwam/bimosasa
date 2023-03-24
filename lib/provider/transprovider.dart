import 'package:flutter/material.dart';

class Transprovider with ChangeNotifier {
  bool? _isloading;

  bool? get isloading => _isloading;
  set isloading(bool? value) {
    _isloading = value;
    notifyListeners();
  }

  
}
