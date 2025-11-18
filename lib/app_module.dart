import 'dart:io';

import 'package:serinus/serinus.dart';
import 'package:serinus_openapi/serinus_openapi.dart';
import 'package:serinus_serve_static/serinus_serve_static.dart';

import 'controllers/skills_controller.dart';
import 'database/database.dart';
import 'providers/database_provider.dart';
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
          DatabaseProvider(AppDatabase()),
          Provider.composed<SkillsService>(
            (CompositionContext context) async => SkillsService(databaseProvider: context.use<DatabaseProvider>()),
            inject: [DatabaseProvider],
          ),
        ],
        controllers: [
          SkillsController(),
        ],
      );
}
