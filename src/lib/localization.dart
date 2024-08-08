import 'package:egorozh_cv/i18n/translations.g.dart';
import 'package:flutter/material.dart';

extension LocalizationExtensions on BuildContext {
  Translations get appTexts => Translations.of(this);
}
