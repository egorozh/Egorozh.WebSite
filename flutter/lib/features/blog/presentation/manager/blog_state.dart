part of 'blog_bloc.dart';

@freezed
class BlogState with _$BlogState {
  const factory BlogState.loading() = _Loading;

  const factory BlogState.loaded(String markdownData) = _Loaded;

  const factory BlogState.failure() = _Failure;
}
