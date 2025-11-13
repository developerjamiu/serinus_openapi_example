import 'package:serinus/serinus.dart';

import '../database/database.dart';

class DatabaseProvider extends Provider with OnApplicationInit, OnApplicationShutdown {
  final AppDatabase _db;

  DatabaseProvider(this._db);

  AppDatabase get db => _db;

  @override
  Future<void> onApplicationInit() async {}

  @override
  Future<void> onApplicationShutdown() async {
    await _db.close();
  }
}
