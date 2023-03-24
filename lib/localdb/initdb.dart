import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'dart:async';

class DB {
  static final DB _db = DB._internal();
  factory DB() => _db;
  DB._internal();

  Database? _database;
  Database? get database => _database;
  // String dbPath = 'bimocashser.db';

  Future<void> init() async {
    const String dbName = 'bimocash.db';
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String dbPath = path.join(dir, dbName);

    // open or create a database
    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> close() async {
    await _database!.close();
  }
}
