import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/core.dart';
import 'features/features.dart';
import 'firebase_options.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  locator.registerSingleton(AppStorage(await SharedPreferences.getInstance()));

  configureDependencies();

  locator.registerLazySingleton(() => BlogApi());
  locator.registerLazySingleton(() => ProjectsApi());

  //setUrlStrategy(PathUrlStrategy());

  final _ = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const EgorozhApp());
}
