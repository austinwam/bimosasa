import 'package:shared_preferences/shared_preferences.dart';

/**
datatype=[int,string, bool]
 
 data
  ____
 1.token
 2.email
 3.amount
 4.username
 5.userimage
 6.userstate
 7.phone
 **/

enum Data {
  firsttime("firsttime"),
  isauth("isauth"),
  userdata("userdata"),
  token("token");

  final String text;
  const Data(this.text);
}

enum Kind {
  aint("int"),
  astring("string"),
  abool("bool");

  final String text;
  const Kind(this.text);
}

class Storedata {
  Future<dynamic> adddata(type, datatype, data) async {
    final prefs = await SharedPreferences.getInstance();
    if (Kind.abool.text == type) {
      prefs.setBool(datatype, data);
    } else if (Kind.astring.text == type) {
      prefs.setString(datatype, data);
    } else if (Kind.aint.text == type) {
      prefs.setInt(datatype, data);
    } else {
      print("an error happed");
      return null;
    }
  }

  Future<dynamic> getdata(kind, datatype) async {
    final prefs = await SharedPreferences.getInstance();
    if (Kind.aint.text == kind) {
      int? data = prefs.getInt(datatype);
      return data;
    } else if (Kind.astring.text == kind) {
      String? data = prefs.getString(datatype);
      return data;
    } else if (Kind.aint.text == kind) {
      String? data = prefs.getString(datatype);
      return data;
    } else {
      print("an error happed");
      return null;
    }
  }
}
