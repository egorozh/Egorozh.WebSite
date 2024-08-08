import 'dart:async';

import '../entities/entities.dart';

abstract interface class ILocalizationRepository {
  FutureOr<List<LocaleInfo>> get supportedLocales;

  LocaleInfo get selectedLocale;

  FutureOr<bool> setLocale(LocaleInfo localeInfo);
}
