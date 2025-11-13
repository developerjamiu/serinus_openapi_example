import 'package:drift/drift.dart';

class Skills extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  IntColumn get yearsOfExperience => integer()();

  TextColumn get category => text()();
}
