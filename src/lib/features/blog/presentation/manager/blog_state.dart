part of 'blog_bloc.dart';

@freezed
class BlogState with _$BlogState {
  const factory BlogState.loading() = _Loading;

  const factory BlogState.loaded(List<ArticleListInfo> articles) = _Loaded;

  const factory BlogState.failure() = _Failure;
}
