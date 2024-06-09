import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/ui/managers/app_cubit.dart';
import 'core/ui/theme/themes.dart';
import 'locator/locator.dart';
import 'router/router.dart';

class EgorozhApp extends StatelessWidget {
  const EgorozhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AppCubit>()..init(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppCubit.supportedLocales,
            locale: state.locale,
            title: state.title,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
