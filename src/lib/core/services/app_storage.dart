import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static const _darkThemeKey = "DarkThemeKey";
 
  final SharedPreferences _prefs;

  AppStorage(this._prefs);

  bool get isDarkMode => _prefs.getBool(_darkThemeKey) ?? true;

  set isDarkMode(bool value) => _prefs.setBool(_darkThemeKey, value);
}
