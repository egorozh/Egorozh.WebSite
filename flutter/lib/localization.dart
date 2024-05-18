import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalizations get appTexts => AppLocalizations.of(this)!;
}
