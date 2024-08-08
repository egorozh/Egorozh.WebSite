import 'dart:async';

import 'package:injectable/injectable.dart';

import '../domain.dart';

@injectable
class LocalizationUseCases {
  final ILocalizationRepository _localizationRepository;

  LocalizationUseCases(this._localizationRepository);

  FutureOr<bool> changeLanguage(LocaleInfo locale) => _localizationRepository.setLocale(locale);

  FutureOr<List<LocaleInfo>> getSupportedLocales() => _localizationRepository.supportedLocales;

  LocaleInfo getSelectedLocale() => _localizationRepository.selectedLocale;

}
