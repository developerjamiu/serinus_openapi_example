import 'package:drift/drift.dart';
import 'package:serinus/serinus.dart';
import '../database/database.dart';
import '../dtos/create_skill_dto.dart';
import '../dtos/skill_response.dart';
import '../dtos/update_skill_dto.dart';
import 'database_service.dart';

class SkillsService extends Provider {
  final DatabaseService _databaseService;

  const SkillsService({required DatabaseService databaseService}) : _databaseService = databaseService;

  AppDatabase get db => _databaseService();

  Future<SkillResponse> createSkill(CreateSkillDto dto) async {
    final id = await db
        .into(db.skills)
        .insert(
          SkillsCompanion(
            name: Value(dto.name),
            yearsOfExperience: Value(dto.yearsOfExperience),
            category: Value(dto.category),
          ),
        );

    return SkillResponse(
      id: id,
      name: dto.name,
      yearsOfExperience: dto.yearsOfExperience,
      category: dto.category,
    );
  }

  Future<List<SkillResponse>> getSkills() async {
    final allSkills = await db.select(db.skills).get();

    return allSkills.map((row) => SkillResponse.fromDatabase(row)).toList();
  }

  Future<SkillResponse> getSkill(int id) async {
    final skill = await (db.select(db.skills)..where((tbl) => tbl.id.equals(id))).getSingle();
    return SkillResponse.fromDatabase(skill);
  }

  Future<SkillResponse> updateSkill(int id, UpdateSkillDto dto) async {
    await (db.update(db.skills)..where((tbl) => tbl.id.equals(id))).write(
      SkillsCompanion(
        name: dto.name != null ? Value(dto.name!) : const Value.absent(),
        yearsOfExperience: dto.yearsOfExperience != null ? Value(dto.yearsOfExperience!) : const Value.absent(),
        category: dto.category != null ? Value(dto.category!) : const Value.absent(),
      ),
    );

    final updatedSkill = await (db.select(db.skills)..where((tbl) => tbl.id.equals(id))).getSingle();

    return SkillResponse.fromDatabase(updatedSkill);
  }

  Future<SkillResponse> deleteSkill(int id) async {
    final skillToDelete = await (db.select(db.skills)..where((tbl) => tbl.id.equals(id))).getSingle();
    await (db.delete(db.skills)..where((tbl) => tbl.id.equals(id))).go();
    return SkillResponse.fromDatabase(skillToDelete);
  }
}
