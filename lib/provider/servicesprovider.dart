import 'package:bimosasa/localdb/localdb.dart';
import 'package:bimosasa/provider/provider.dart';
import 'package:flutter/material.dart';

class Serviceprovider with ChangeNotifier {
  List<Servicemodels> _servicemodels = [];

  List<Servicemodels> get servicemodels => _servicemodels;

  set servicemodels(List<Servicemodels> value) {
    _servicemodels = value;
    notifyListeners();
  }

  bool? _isloading;

  bool? get isloading => _isloading;
  set isloading(bool? value) {
    _isloading = value;
    notifyListeners();
  }

  Future<void> getservices() async {
    isloading = true;
    isloading = false;
  }

  Future<void> removeservices(serviceid, index) async {
    isloading = true;
    Servicedb().removeservice(serviceid);
    servicemodels.remove(index);
    isloading = false;
  }
}
