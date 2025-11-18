import 'package:serinus/serinus.dart';

import '../database/database.dart';

class DatabaseService extends Provider with OnApplicationShutdown {
  final AppDatabase _db;

  DatabaseService(this._db);

  AppDatabase call() => _db;

  @override
  Future<void> onApplicationShutdown() async {
    await _db.close();
  }
}
