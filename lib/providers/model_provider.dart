import 'package:serinus/serinus.dart';

import '../dtos/create_skill_dto.dart';
import '../dtos/skill_response.dart';
import '../dtos/update_skill_dto.dart';

/// The [SerinusPulseModelProvider] is used to provide models for the Serinus application.
/// It contains mappings for serializing and deserializing models to and from JSON.
class SerinusPulseModelProvider extends ModelProvider {
  @override
  Map<String, Function> get toJsonModels {
    return {
      'SkillResponse': (model) => (model as SkillResponse).toJson(),
      'CreateSkillDto': (model) => (model as CreateSkillDto).toJson(),
      'UpdateSkillDto': (model) => (model as UpdateSkillDto).toJson(),
    };
  }

  @override
  Map<String, Function> get fromJsonModels {
    return {
      'SkillResponse': SkillResponse.fromJson,
      'CreateSkillDto': CreateSkillDto.fromJson,
      'UpdateSkillDto': UpdateSkillDto.fromJson,
    };
  }
}
