import 'package:serinus/serinus.dart';

final updateProjectSchema = object({
  'title': string().min(1).max(100).nullable(),
  'description': string().nullable(),
  'url': string().url().nullable(),
});

class UpdateProjectDto with JsonObject {
  final String? title;
  final String? description;
  final String? url;

  UpdateProjectDto({
    this.title,
    this.description,
    this.url,
  });

  factory UpdateProjectDto.fromJson(Map<String, dynamic> json) {
    final result = updateProjectSchema.tryParse(json);

    if (!result.success) {
      throw BadRequestException('Validation failed: ${result.errors}');
    }

    final data = result.value;

    return UpdateProjectDto(
      title: data['title'] as String?,
      description: data['description'] as String?,
      url: data['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    if (title != null) 'title': title,
    if (description != null) 'description': description,
    if (url != null) 'url': url,
  };
}
