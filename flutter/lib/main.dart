import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'features/features.dart';
import 'firebase_options.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  locator.registerLazySingleton(() => BlogApi());
  locator.registerLazySingleton(() => ProjectsApi());

  //setUrlStrategy(PathUrlStrategy());

  final _ = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const EgorozhApp());
}
