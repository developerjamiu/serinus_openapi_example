import 'package:serinus/serinus.dart';
import '../dtos/create_skill_dto.dart';
import '../dtos/empty_dto.dart';
import '../dtos/skill_response.dart';
import '../services/skills_service.dart';

class SkillsController extends Controller {
  SkillsController() : super('/skills') {
    on<SkillResponse, CreateSkillDto>(Route.post('/'), _createSkill);

    on<List<SkillResponse>, EmptyDto>(Route.get('/'), _getSkills);
  }

  Future<SkillResponse> _createSkill(RequestContext<CreateSkillDto> context) {
    return context.use<SkillsService>().createSkill(context.body);
  }

  Future<List<SkillResponse>> _getSkills(RequestContext<EmptyDto> context) {
    return context.use<SkillsService>().getSkills();
  }
}
