part of 'lang_cubit.dart';

@freezed
class LangState with _$LangState {
  const factory LangState({
    @Default(false) bool isLoading,
    LocaleInfo? selectedLocale,
    List<LocaleInfo>? supportedLocales,
  }) = _LangState;
}
