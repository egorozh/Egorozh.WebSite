import 'package:egorozh_cv/features/features.dart';
import 'package:egorozh_cv/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/ui/managers/app_cubit.dart';
import 'core/ui/theme/themes.dart';
import 'locator/locator.dart';
import 'router/router.dart';

class EgorozhApp extends StatelessWidget {
  const EgorozhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AppCubit>()..init()),
        BlocProvider(create: (_) => locator<LangCubit>(param1: context)),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, langState) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp.router(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocaleUtils.supportedLocales,
                locale: TranslationProvider.of(context).flutterLocale,
                title: langState.selectedLocale?.appTitle ?? "Zheludkov Egor",
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: state.themeMode,
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}
