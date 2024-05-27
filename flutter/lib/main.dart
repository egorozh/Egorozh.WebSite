import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app.dart';
import 'features/features.dart';
import 'firebase_options.dart';
import 'locator/locator.dart';

void main() async {
  configureDependencies();

  locator.registerLazySingleton(() => ProjectsApi());

  setUrlStrategy(PathUrlStrategy());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const EgorozhApp());
}
