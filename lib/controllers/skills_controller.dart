import 'package:drift/drift.dart';
import 'package:serinus/serinus.dart';
import '../database/database.dart';
import '../dtos/create_skill_dto.dart';
import '../dtos/skill_response.dart';
import '../providers/database_provider.dart';

class SkillsController extends Controller {
  SkillsController() : super('/skills') {
    on<SkillResponse, CreateSkillDto>(Route.post('/'), _createSkill);

    on<List<SkillResponse>, void>(Route.get('/'), _getSkills);
  }

  Future<SkillResponse> _createSkill(RequestContext<CreateSkillDto> context) async {
    final dto = context.body;
    final db = context.use<DatabaseProvider>().db;

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

  Future<List<SkillResponse>> _getSkills(RequestContext<void> context) async {
    final db = context.use<DatabaseProvider>().db;
    final allSkills = await db.select(db.skills).get();

    return allSkills.map((row) => SkillResponse.fromDatabase(row)).toList();
  }
}
