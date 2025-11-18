import 'package:drift/drift.dart';
import 'package:serinus/serinus.dart';
import '../database/database.dart';
import '../dtos/create_skill_dto.dart';
import '../dtos/skill_response.dart';
import '../providers/database_provider.dart';

class SkillsService extends Provider {
  final DatabaseProvider _databaseProvider;

  const SkillsService({required DatabaseProvider databaseProvider}) : _databaseProvider = databaseProvider;

  AppDatabase get db => _databaseProvider();

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
}
