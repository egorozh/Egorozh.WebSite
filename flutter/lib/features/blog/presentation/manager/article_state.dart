part of 'article_bloc.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState.loading() = _Loading;

  const factory ArticleState.loaded(String markdownData) = _Loaded;

  const factory ArticleState.failure() = _Failure;
}
