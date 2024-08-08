import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/core.dart';
import 'features/features.dart';
import 'firebase_options.dart';
import 'i18n/translations.g.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  final localizationRepository = LocalizationRepository(sharedPreferences);
  await localizationRepository.init();

  locator.registerSingleton<ILocalizationRepository>(localizationRepository);
  locator.registerSingleton(AppStorage(sharedPreferences));

  configureDependencies();

  locator.registerLazySingleton(() => BlogApi());
  locator.registerLazySingleton(() => ProjectsApi());

  //setUrlStrategy(PathUrlStrategy());

  final _ = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(TranslationProvider(child: const EgorozhApp()));
}
