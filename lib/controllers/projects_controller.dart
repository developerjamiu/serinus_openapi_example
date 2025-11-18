import 'package:serinus/serinus.dart';
import '../dtos/create_project_dto.dart';
import '../dtos/project_response.dart';
import '../dtos/update_project_dto.dart';
import '../services/projects_service.dart';

class ProjectsController extends Controller {
  ProjectsController() : super('/projects') {
    on(Route.post('/'), _createProject);

    on(Route.get('/'), _getProjects);

    on(Route.get('/<id>'), _getProject);

    on(Route.patch('/<id>'), _updateProject);

    on(Route.delete('/<id>'), _deleteProject);
  }

  Future<ProjectResponse> _createProject(RequestContext<CreateProjectDto> context) {
    return context.use<ProjectsService>().createProject(context.body);
  }

  Future<List<ProjectResponse>> _getProjects(RequestContext context) {
    return context.use<ProjectsService>().getProjects();
  }

  Future<ProjectResponse> _getProject(RequestContext context) {
    final id = int.parse(context.params['id']);
    return context.use<ProjectsService>().getProject(id);
  }

  Future<ProjectResponse> _updateProject(RequestContext<UpdateProjectDto> context) {
    final id = int.parse(context.params['id']);
    return context.use<ProjectsService>().updateProject(id, context.body);
  }

  Future<ProjectResponse> _deleteProject(RequestContext context) {
    final id = int.parse(context.params['id']);
    return context.use<ProjectsService>().deleteProject(id);
  }
}
