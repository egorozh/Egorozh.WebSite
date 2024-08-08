import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'lang_cubit.freezed.dart';
part 'lang_state.dart';

@injectable
class LangCubit extends ContextCubit<LangState> {
  LangCubit(this._useCases, @factoryParam BuildContext context) : super(const LangState(), context) {
    _init();
  }

  final LocalizationUseCases _useCases;

  void _init() async {
    final selectedLocale = _useCases.getSelectedLocale();
    final supportedLocales = await _useCases.getSupportedLocales();

    emit(state.copyWith(
      selectedLocale: selectedLocale,
      supportedLocales: supportedLocales,
    ));
  }

  Future<void> changeLanguage(LocaleInfo locale) async {
    emit(state.copyWith(isLoading: true));
    final _ = await _useCases.changeLanguage(locale);
    if (!context.mounted) return;
    emit(state.copyWith(selectedLocale: locale, isLoading: false));
  }
}
