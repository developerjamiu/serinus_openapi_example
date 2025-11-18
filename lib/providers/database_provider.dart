import 'package:serinus/serinus.dart';

import '../database/database.dart';

class DatabaseProvider extends Provider with OnApplicationShutdown {
  final AppDatabase _db;

  DatabaseProvider(this._db);

  AppDatabase call() => _db;

  @override
  Future<void> onApplicationShutdown() async {
    await _db.close();
  }
}
