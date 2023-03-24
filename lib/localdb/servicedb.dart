import 'package:bimosasa/const.dart';
import 'package:bimosasa/localdb/initdb.dart';
import 'package:sembast/sembast.dart';

import '../provider/provider.dart';

class Servicedb {
  /*
  get,remove,add
  */
  Future<void> add(servicemodel) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().servicedb);
    await store.add(db!, servicemodel);
  }

  Future<dynamic> getall() async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().servicedb);
    var servicedbs = await store.find(db!);
    List<Servicemodels> services =
        await Formatdata().service(servicedbs, false);
    return services;
  }

  Future<void> removeservice(serviceid) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().servicedb);
    var finder = Finder(
        filter: Filter.greaterThan('serviceid', serviceid),
        sortOrders: [SortOrder('name')]);
    await store.delete(db!, finder: finder);
  }

  Future bookmarks() async {
    await DB().init();

    final Database? db = DB().database;
    var store = intMapStoreFactory.store(Constants().servicedb);

    Finder(
        filter: Filter.equals('bookmark', true),
        sortOrders: [SortOrder('sdatetime')]);

    var records = await store.find(
      db!,
    );

    await DB().close();
  }
}
