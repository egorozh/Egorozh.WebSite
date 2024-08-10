part of 'blog_bloc.dart';

@freezed
class BlogEvent with _$BlogEvent {
  const factory BlogEvent.started() = _Started;

  const factory BlogEvent.load({Completer<void>? completer, String? locale}) = _Load;

  const factory BlogEvent.goToArticle({required ArticleListInfo article}) = _GoToArticle;
}
