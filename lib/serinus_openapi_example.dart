import 'dart:io';

import 'package:serinus/serinus.dart';

import 'app_module.dart';
import 'providers/model_provider.dart';

Future<void> bootstrap() async {
  final app = await serinus.createApplication(
    entrypoint: AppModule(),
    host: '0.0.0.0',
    port: int.tryParse(Platform.environment['GLOBE_PORT'] ?? '8080') ?? 8080,
    modelProvider: SerinusPulseModelProvider(),
  );
  await app.serve();
}
