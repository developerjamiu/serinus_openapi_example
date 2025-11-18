import 'package:serinus/serinus.dart';

final projectSchema = object({
  'title': string().min(1).max(100),
  'description': string(),
  'url': string().url(),
});

class CreateProjectDto with JsonObject {
  final String title;
  final String description;
  final String url;

  CreateProjectDto({
    required this.title,
    required this.description,
    required this.url,
  });

  factory CreateProjectDto.fromJson(Map<String, dynamic> json) {
    final result = projectSchema.tryParse(json);

    if (!result.success) {
      throw BadRequestException('Validation failed: ${result.errors}');
    }

    final data = result.value;

    return CreateProjectDto(
      title: data['title'] as String,
      description: data['description'] as String,
      url: data['url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'url': url,
  };
}
