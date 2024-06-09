import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@Singleton()
class AppCubit extends Cubit<AppState> {
  final AppStorage _appStorage;

  AppCubit(this._appStorage) : super(const AppState(themeMode: ThemeMode.dark, locale: englishLocale));

  static const englishLocale = Locale('en');
  static const russianLocale = Locale('ru');

  static const supportedLocales = [
    englishLocale,
    russianLocale,
  ];

  void init() async {
    emit(
      AppState(
        themeMode: _appStorage.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        locale: _appStorage.locale == englishLocale.languageCode ? englishLocale : russianLocale,
      ),
    );
  }

  void changeTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));

    _appStorage.isDarkMode = mode == ThemeMode.dark;
  }

  void changeLanguage(Locale locale) {
    emit(state.copyWith(locale: locale));

    _appStorage.locale = locale.languageCode;
  }
}
