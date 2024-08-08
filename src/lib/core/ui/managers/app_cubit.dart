import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@Singleton()
class AppCubit extends Cubit<AppState> {
  final AppStorage _appStorage;

  AppCubit(this._appStorage) : super(const AppState(themeMode: ThemeMode.dark));

  void init() async {
    emit(AppState(themeMode: _appStorage.isDarkMode ? ThemeMode.dark : ThemeMode.light));
  }

  void changeTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));

    _appStorage.isDarkMode = mode == ThemeMode.dark;
  }
}
