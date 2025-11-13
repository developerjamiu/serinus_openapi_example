import 'package:serinus/serinus.dart';

import '../database/database.dart';

class SkillResponse with JsonObject {
  final int id;
  final String name;
  final int yearsOfExperience;
  final String category;

  SkillResponse({
    required this.id,
    required this.name,
    required this.yearsOfExperience,
    required this.category,
  });

  factory SkillResponse.fromDatabase(Skill row) {
    return SkillResponse(
      id: row.id,
      name: row.name,
      yearsOfExperience: row.yearsOfExperience,
      category: row.category,
    );
  }

  factory SkillResponse.fromJson(Map<String, dynamic> json) {
    return SkillResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      yearsOfExperience: json['yearsOfExperience'] as int,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'yearsOfExperience': yearsOfExperience,
    'category': category,
  };
}
