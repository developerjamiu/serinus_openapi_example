import 'package:serinus/serinus.dart';
import '../dtos/create_skill_dto.dart';
import '../dtos/skill_response.dart';
import '../dtos/update_skill_dto.dart';
import '../services/skills_service.dart';

class SkillsController extends Controller {
  SkillsController() : super('/skills') {
    on(Route.post('/'), _createSkill);

    on(Route.get('/'), _getSkills);

    on(Route.get('/<id>'), _getSkill);

    on(Route.patch('/<id>'), _updateSkill);

    on(Route.delete('/<id>'), _deleteSkill);
  }

  Future<SkillResponse> _createSkill(RequestContext<CreateSkillDto> context) {
    return context.use<SkillsService>().createSkill(context.body);
  }

  Future<List<SkillResponse>> _getSkills(RequestContext context) {
    return context.use<SkillsService>().getSkills();
  }

  Future<SkillResponse> _getSkill(RequestContext context) {
    final id = int.parse(context.params['id']);
    return context.use<SkillsService>().getSkill(id);
  }

  Future<SkillResponse> _updateSkill(RequestContext<UpdateSkillDto> context) {
    final id = int.parse(context.params['id']);
    return context.use<SkillsService>().updateSkill(id, context.body);
  }

  Future<SkillResponse> _deleteSkill(RequestContext context) {
    final id = int.parse(context.params['id']);
    return context.use<SkillsService>().deleteSkill(id);
  }
}
