import 'package:bimosasa/const.dart';
import 'package:bimosasa/localdb/initdb.dart';
import 'package:bimosasa/provider/provider.dart';
import 'package:sembast/sembast.dart';

class Transdb {
  Future<void> add(transmodel) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().transdb);
    await store.add(db!, transmodel);
  }

  Future<dynamic> getall() async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().transdb);
    var trans = await store.find(db!);
    List<Tranmodel> transdata = await Formatdata().trans(trans, false);
    return transdata;
  }

  Future<void> remove(transid) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().servicedb);
    var finder = Finder(
      filter: Filter.greaterThan('transid', transid),
    );
    await store.delete(db!, finder: finder);
  }

  Future<dynamic> getbyuserid(userid) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().servicedb);
    var finder = Finder(
      filter: Filter.greaterThan('userid', userid),
    );
    var trans = await store.find(db!, finder: finder);
    List<Tranmodel> transdata = await Formatdata().trans(trans, false);
    return transdata;
  }
}
