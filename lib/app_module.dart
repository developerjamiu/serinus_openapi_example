import 'dart:io';

import 'package:serinus/serinus.dart';
import 'package:serinus_openapi/serinus_openapi.dart';
import 'package:serinus_serve_static/serinus_serve_static.dart';

import 'controllers/projects_controller.dart';
import 'controllers/skills_controller.dart';
import 'database/database.dart';
import 'services/database_service.dart';
import 'services/projects_service.dart';
import 'services/skills_service.dart';

class AppModule extends Module {
  AppModule()
    : super(
        imports: [
          ServeStaticModule(),
          OpenApiModule.v3(
            InfoObject(
              title: 'StackTrack API',
              version: '1.0.0',
              description: 'Developer Portfolio API powered by Serinus 2.0',
            ),
            analyze: Platform.environment['GLOBE'] != '1',
            specFileSavePath: 'public',
          ),
        ],
        providers: [
          DatabaseService(AppDatabase()),
          Provider.composed<SkillsService>(
            (CompositionContext context) async => SkillsService(
              databaseService: context.use<DatabaseService>(),
            ),
            inject: [DatabaseService],
          ),
          Provider.composed<ProjectsService>(
            (CompositionContext context) async => ProjectsService(
              databaseService: context.use<DatabaseService>(),
            ),
            inject: [DatabaseService],
          ),
        ],
        controllers: [
          SkillsController(),
          ProjectsController(),
        ],
      );
}
