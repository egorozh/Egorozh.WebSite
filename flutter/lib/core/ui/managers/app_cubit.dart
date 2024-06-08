import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@Singleton()
class AppCubit extends Cubit<AppState> {
  late final SharedPreferences _prefs;

  final String _darkThemeKey = "DarkThemeKey";
  final String _localeKey = "LocaleKey";

  AppCubit()
      : super(
          const AppState(
            themeMode: ThemeMode.dark,
            locale: Locale('en'),
          ),
        );

  void init() async {
    _prefs = await SharedPreferences.getInstance();

    final isDarkMode = _prefs.getBool(_darkThemeKey) ?? true;
    final locale = _prefs.getString(_localeKey) ?? "en";

    emit(
      AppState(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        locale: Locale(locale),
      ),
    );
  }

  void changeTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));

    _prefs.setBool(_darkThemeKey, mode == ThemeMode.dark);
  }

  void changeLanguage(String locale) {
    emit(state.copyWith(locale: Locale(locale)));

    _prefs.setString(_localeKey, locale);
  }
}
