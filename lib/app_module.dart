import 'package:serinus/serinus.dart';
import 'package:serinus_openapi/serinus_openapi.dart';

import 'controllers/skills_controller.dart';
import 'database/database.dart';
import 'providers/database_provider.dart';

class AppModule extends Module {
  AppModule()
    : super(
        imports: [
          OpenApiModule.v3(
            InfoObject(
              title: 'StackTrack API',
              version: '1.0.0',
              description: 'Developer Portfolio API powered by Serinus 2.0',
            ),
            analyze: true,
          ),
        ],
        providers: [
          DatabaseProvider(AppDatabase()),
        ],
        controllers: [
          SkillsController(),
        ],
      );
}
