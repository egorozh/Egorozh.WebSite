import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

class AppStorage {
  static const _darkThemeKey = "DarkThemeKey";
  static const _localeKey = "LocaleKey";

  final SharedPreferences _prefs;

  AppStorage(this._prefs);

  bool get isDarkMode => _prefs.getBool(_darkThemeKey) ?? true;

  set isDarkMode(bool value) => _prefs.setBool(_darkThemeKey, value);

  String get locale => _prefs.getString(_localeKey) ?? AppCubit.englishLocale.languageCode;

  set locale(String value) => _prefs.setString(_localeKey, value);
}
