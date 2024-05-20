import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/core.dart';
import 'features/router/router.dart';

void main() {
  runApp(const EgorozhApp());
}

class EgorozhApp extends StatelessWidget {
  const EgorozhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        //Locale('en'),
        Locale('ru'),
      ],
      title: "Желудков Егор",
      theme: darkTheme,
      routerConfig: router,
    );
  }
}
