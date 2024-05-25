import 'package:egorozh_cv/features/my_projects/data/data_sources/data_sources.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'locator/locator.dart';

void main() async {
  configureDependencies();

  locator.registerLazySingleton(() => ProjectsApi());

  runApp(const EgorozhApp());
}
