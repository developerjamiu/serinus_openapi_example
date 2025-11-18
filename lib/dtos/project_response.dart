import 'package:serinus/serinus.dart';

import '../database/database.dart';

class ProjectResponse with JsonObject {
  final int id;
  final String title;
  final String description;
  final String url;

  ProjectResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
  });

  factory ProjectResponse.fromDatabase(Project row) {
    return ProjectResponse(
      id: row.id,
      title: row.title,
      description: row.description,
      url: row.url,
    );
  }

  factory ProjectResponse.fromJson(Map<String, dynamic> json) {
    return ProjectResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'url': url,
  };
}
