part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ThemeMode themeMode,
    required Locale locale,
  }) = _AppState;

  const AppState._();

  String get title => locale == AppCubit.russianLocale ? "Желудков Егор" : "Zheludkov Egor";
}
