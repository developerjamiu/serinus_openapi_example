import 'package:drift/drift.dart';
import 'package:serinus/serinus.dart';
import '../database/database.dart';
import '../dtos/create_project_dto.dart';
import '../dtos/project_response.dart';
import '../dtos/update_project_dto.dart';
import 'database_service.dart';

class ProjectsService extends Provider {
  final DatabaseService _databaseService;

  const ProjectsService({required DatabaseService databaseService}) : _databaseService = databaseService;

  AppDatabase get db => _databaseService();

  Future<ProjectResponse> createProject(CreateProjectDto dto) async {
    final id = await db
        .into(db.projects)
        .insert(
          ProjectsCompanion(
            title: Value(dto.title),
            description: Value(dto.description),
            url: Value(dto.url),
          ),
        );

    return ProjectResponse(
      id: id,
      title: dto.title,
      description: dto.description,
      url: dto.url,
    );
  }

  Future<List<ProjectResponse>> getProjects() async {
    final allProjects = await db.select(db.projects).get();

    return allProjects.map((row) => ProjectResponse.fromDatabase(row)).toList();
  }

  Future<ProjectResponse> getProject(int id) async {
    final project = await (db.select(db.projects)..where((tbl) => tbl.id.equals(id))).getSingle();
    return ProjectResponse.fromDatabase(project);
  }

  Future<ProjectResponse> updateProject(int id, UpdateProjectDto dto) async {
    await (db.update(db.projects)..where((tbl) => tbl.id.equals(id))).write(
      ProjectsCompanion(
        title: dto.title != null ? Value(dto.title!) : const Value.absent(),
        description: dto.description != null ? Value(dto.description!) : const Value.absent(),
        url: dto.url != null ? Value(dto.url!) : const Value.absent(),
      ),
    );

    final updatedProject = await (db.select(db.projects)..where((tbl) => tbl.id.equals(id))).getSingle();

    return ProjectResponse.fromDatabase(updatedProject);
  }

  Future<ProjectResponse> deleteProject(int id) async {
    final projectToDelete = await (db.select(db.projects)..where((tbl) => tbl.id.equals(id))).getSingle();
    await (db.delete(db.projects)..where((tbl) => tbl.id.equals(id))).go();
    return ProjectResponse.fromDatabase(projectToDelete);
  }
}
