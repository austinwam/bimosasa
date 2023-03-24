import 'package:flutter/widgets.dart';

class Banksmodel {
  String? bankname, bankcode;

  Banksmodel({this.bankname, this.bankcode});
  Banksmodel.fromMap(Map<String, dynamic> map) {
    bankname = map["bank_name"];
    bankcode = map["bank_code"];
  }
}

class Tranmodel {
  int? tid, userid, transid, amount, transhide, timestamp, kindid;
  String? refid, transuid, phone, kind, kindname, kindimage, status;

  Tranmodel(
      {this.tid,
      this.status,
      this.transid,
      this.userid,
      this.amount,
      this.phone,
      this.kindid,
      this.kind,
      this.kindname,
      this.kindimage,
      this.timestamp,
      this.transhide,
      this.refid,
      this.transuid});

  Tranmodel.fromMap(Map<String, dynamic> map) {
    tid = map['tid'];
    transid = map['transid'];
    transuid = map['transuid'];
    status = map['status'];
    kind = map["kind"];
    kindid = map["kindid"];
    kindname = map["kindname"];
    kindimage = map["kindimage"];
    amount = map['amount'];
    phone = map['phone'];
    userid = map["userid"];
    refid = map['refid'];
    transhide = map['transhide'];
    timestamp = map['timestamp'];
  }
}

class Usermodel {
  int? userid, datetime, bookmark, islocal, active;
  String? username, email, phone, userpic;
  Usermodel(
      {this.userid,
      this.username,
      this.phone,
      this.active,
      this.bookmark,
      this.islocal,
      this.email,
      this.datetime,
      this.userpic});
  Usermodel.fromMap(Map<String, dynamic> map) {
    userid = map['userid'];
    username = map['username'];
    userpic = map['userimage'];
    phone = map["phone"];
    active = map['active'];
    bookmark = map['bookmark'];
    islocal = map['islocal'];
    email = map['email'];
    datetime = map['datetime'];
  }
}

class Accountmodel {
  int? id;
  String? name, accountname, categoryname, utilnumber;
  Accountmodel(
      {this.id,
      this.accountname,
      this.categoryname,
      this.name,
      this.utilnumber});
  Accountmodel.fromMap(Map<String, dynamic> map) {
    id = map['uid'];
    name = map['uname'];
    accountname = map["phone"];
    categoryname = map['categoryname'];
    utilnumber = map['unumber'];
  }
}

class Servicesmodels {
  int? sid;
  String? servirename;

  String? image, email, descriptions;
  Servicesmodels({
    @required this.sid,
    @required this.servirename,
    this.descriptions,
    this.image,
  });
  Servicesmodels.fromMap(Map<String, dynamic> map) {
    sid = map["id"];
    servirename = map["title"];
    image = map["imageurl"];
    email = map["contact"];
    descriptions = map["description"];
  }
}

class Servicemodels {
  int? siid, qty, minamount, maxamount, sdate;

  String? image, descriptions, name, location, catename, price;
  Servicemodels(
      {@required this.siid,
      @required this.name,
      @required this.catename,
      this.descriptions,
      this.location,
      this.image,
      this.qty,
      this.minamount,
      this.maxamount});
  Servicemodels.fromMap(Map<String, dynamic> map) {
    siid = map["id"];
    name = map["name"];
    image = map["image"];

    qty = map["qty"];
    price = map["price"];
    minamount = map["minamount"];
    maxamount = map["maxamount"];
    catename = map["categoryname"];
    descriptions = map["description"];
    sdate = map["sdatetime"];
  }
}

class Categorysmodels {
  int? cid;
  String? categoryname, cateimage;
  Categorysmodels({
    this.cid,
    this.categoryname,
    this.cateimage,
  });
  Categorysmodels.fromMap(Map<String, dynamic> map) {
    cid = map["id"];
    categoryname = map["catename"];
    cateimage = map["cateimage"];
  }
}

class Agentsmodels {
  int? aid, amount;
  String? name, image, shopid;
  bool? active;
  Agentsmodels({
    this.aid,
    this.name,
    this.image,
    this.active,
    this.amount,
    this.shopid,
  });
  Agentsmodels.fromMap(Map<String, dynamic> map) {
    aid = map["id"];
    name = map["name"];
    image = map["image"];
    amount = map["money"];
    active = map["active"];
    shopid = map["shopid"];
  }
}

class Locmodel {
  double? distance;
  int? id;
  String? description;
  String? longitude;
  String? latitude;
  String? areaName;
  Locmodel({
    this.distance,
    this.id,
    this.description,
    this.longitude,
    this.latitude,
    this.areaName,
  });
  Locmodel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    distance = map['distance'];
    description = map["description"];
    longitude = map['longitude'];
    latitude = map['latitude'];
    areaName = map['areaName'];
  }
}
