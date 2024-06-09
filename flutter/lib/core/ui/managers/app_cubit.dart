import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@Singleton()
class AppCubit extends Cubit<AppState> {
  static const _darkThemeKey = "DarkThemeKey";
  static const _localeKey = "LocaleKey";

  static const englishLocale = Locale('en');
  static const russianLocale = Locale('ru');

  static const supportedLocales = [
    englishLocale,
    russianLocale,
  ];

  late final SharedPreferences _prefs;

  AppCubit() : super(const AppState(themeMode: ThemeMode.dark, locale: englishLocale));

  void init() async {
    _prefs = await SharedPreferences.getInstance();

    final isDarkMode = _prefs.getBool(_darkThemeKey) ?? true;
    final locale = _prefs.getString(_localeKey) ?? "en";

    emit(
      AppState(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        locale: locale == "en" ? englishLocale : russianLocale,
      ),
    );
  }

  void changeTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));

    _prefs.setBool(_darkThemeKey, mode == ThemeMode.dark);
  }

  void changeLanguage(Locale locale) {
    emit(state.copyWith(locale: locale));

    _prefs.setString(_localeKey, locale.languageCode);
  }
}
