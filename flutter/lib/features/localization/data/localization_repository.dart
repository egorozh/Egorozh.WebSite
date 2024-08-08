import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../i18n/translations.g.dart';
import '../domain/domain.dart';

class LocalizationRepository implements ILocalizationRepository {
  static const _localeKey = "LocaleKey";

  final SharedPreferences _prefs;

  LocalizationRepository(this._prefs);

  Future<void> init() async {
    final locale = _prefs.getString(_localeKey);

    if (locale != null) LocaleSettings.setLocale(AppLocaleUtils.parse(locale));
  }

  @override
  List<LocaleInfo> get supportedLocales => AppLocale.values
      .map((e) => (
            name: _getLocaleName(e),
            code: e.languageCode,
            appTitle: _getAppTitle(e),
          ))
      .toList(growable: false);

  @override
  LocaleInfo get selectedLocale => (
        name: _getLocaleName(LocaleSettings.currentLocale),
        code: LocaleSettings.currentLocale.languageCode,
        appTitle: _getAppTitle(LocaleSettings.currentLocale),
      );

  @override
  Future<bool> setLocale(LocaleInfo localeInfo) async {
    //safe parser, returns base locale if not found
    final locale = AppLocaleUtils.parse(localeInfo.code);

    LocaleSettings.setLocale(locale);
    return _prefs.setString(_localeKey, locale.languageCode);
  }

  String _getLocaleName(AppLocale locale) => switch (locale) {
        AppLocale.ru => "Русский",
        AppLocale.en => "English",
      };

  String _getAppTitle(AppLocale locale) => switch (locale) {
        AppLocale.ru => "Желудков Егор",
        AppLocale.en => "Zheludkov Egor",
      };
}
