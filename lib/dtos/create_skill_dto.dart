import 'package:serinus/serinus.dart';

final skillSchema = object({
  'name': string().min(1).max(50),
  'yearsOfExperience': number().positive().integer(),
  'category': string().contained(['Backend', 'Frontend', 'DevOps', 'Mobile']),
});

class CreateSkillDto with JsonObject {
  final String name;
  final int yearsOfExperience;
  final String category;

  CreateSkillDto({
    required this.name,
    required this.yearsOfExperience,
    required this.category,
  });

  factory CreateSkillDto.fromJson(Map<String, dynamic> json) {
    final result = skillSchema.tryParse(json);

    if (!result.success) {
      throw BadRequestException('Validation failed: ${result.errors}');
    }

    final data = result.value;

    return CreateSkillDto(
      name: data['name'] as String,
      yearsOfExperience: data['yearsOfExperience'] as int,
      category: data['category'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'yearsOfExperience': yearsOfExperience,
    'category': category,
  };
}
