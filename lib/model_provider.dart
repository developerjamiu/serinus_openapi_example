import 'package:serinus/serinus.dart';

import 'database/database.dart';
import 'dtos/create_project_dto.dart';
import 'dtos/create_skill_dto.dart';
import 'dtos/project_response.dart';
import 'dtos/skill_response.dart';
import 'dtos/update_project_dto.dart';
import 'dtos/update_skill_dto.dart';

/// The [SerinusOpenapiExampleModelProvider] is used to provide models for the Serinus application.
/// It contains mappings for serializing and deserializing models to and from JSON.
class SerinusOpenapiExampleModelProvider extends ModelProvider {
  @override
  Map<String, Function> get toJsonModels {
    return {
      "Skill": (model) => (model as Skill).toJson(),
      "Project": (model) => (model as Project).toJson(),
      "SkillResponse": (model) => (model as SkillResponse).toJson(),
      "ProjectResponse": (model) => (model as ProjectResponse).toJson(),
      "UpdateSkillDto": (model) => (model as UpdateSkillDto).toJson(),
      "CreateSkillDto": (model) => (model as CreateSkillDto).toJson(),
      "UpdateProjectDto": (model) => (model as UpdateProjectDto).toJson(),
      "CreateProjectDto": (model) => (model as CreateProjectDto).toJson()
    };
  }

  @override
  Map<String, Function> get fromJsonModels {
    return {
      "Skill": (json) => Skill.fromJson(json),
      "Project": (json) => Project.fromJson(json),
      "SkillResponse": (json) => SkillResponse.fromJson(json),
      "ProjectResponse": (json) => ProjectResponse.fromJson(json),
      "UpdateSkillDto": (json) => UpdateSkillDto.fromJson(json),
      "CreateSkillDto": (json) => CreateSkillDto.fromJson(json),
      "UpdateProjectDto": (json) => UpdateProjectDto.fromJson(json),
      "CreateProjectDto": (json) => CreateProjectDto.fromJson(json)
    };
  }
}
