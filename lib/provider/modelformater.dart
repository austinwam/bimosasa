import 'package:bimosasa/localdb/localdb.dart';

import 'model.dart';

class Formatdata {
  Future<List<Usermodel>> user(users, bool addtodb) async {
    List<Usermodel> usermodel = [];
    for (var i = 0; i < users.length; i++) {
      Usermodel user = Usermodel.fromMap(users[i]);
      usermodel.add(user);
      if (addtodb == true) {
        Userdb().adduser(user);
      }
    }
    return usermodel;
  }

  Future<List<Servicemodels>> service(services, bool addtodb) async {
    List<Servicemodels> servicemodel = [];
    for (var i = 0; i < services.length; i++) {
      Servicemodels service = Servicemodels.fromMap(services[i]);
      servicemodel.add(service);
      if (addtodb == true) {
        Servicedb().add(service);
      }
    }
    return servicemodel;
  }

  Future<List<Tranmodel>> trans(trans, bool addtodb) async {
    List<Tranmodel> tranmodels = [];
    for (var i = 0; i < trans.length; i++) {
      Tranmodel tran = Tranmodel.fromMap(trans[i]);
      tranmodels.add(tran);
      if (addtodb == true) {
        Transdb().add(tran);
      }
    }
    return tranmodels;
  }
}
