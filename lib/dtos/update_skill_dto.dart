import 'package:serinus/serinus.dart';

final updateSkillSchema = object({
  'name': string().min(1).max(50).nullable(),
  'yearsOfExperience': number().positive().integer().nullable(),
  'category': string().contained(['Backend', 'Frontend', 'DevOps', 'Mobile']).nullable(),
});

class UpdateSkillDto with JsonObject {
  final String? name;
  final int? yearsOfExperience;
  final String? category;

  UpdateSkillDto({
    this.name,
    this.yearsOfExperience,
    this.category,
  });

  factory UpdateSkillDto.fromJson(Map<String, dynamic> json) {
    final result = updateSkillSchema.tryParse(json);

    if (!result.success) {
      throw BadRequestException('Validation failed: ${result.errors}');
    }

    final data = result.value;

    return UpdateSkillDto(
      name: data['name'] as String?,
      yearsOfExperience: data['yearsOfExperience'] as int?,
      category: data['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    if (name != null) 'name': name,
    if (yearsOfExperience != null) 'yearsOfExperience': yearsOfExperience,
    if (category != null) 'category': category,
  };
}
