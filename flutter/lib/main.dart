import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app.dart';
import 'features/features.dart';
import 'locator/locator.dart';

void main() async {
  configureDependencies();

  locator.registerLazySingleton(() => ProjectsApi());

  setUrlStrategy(PathUrlStrategy());

  runApp(const EgorozhApp());
}
