part of 'article_bloc.dart';

@freezed
class ArticleEvent with _$ArticleEvent {
  const factory ArticleEvent.started(BuildContext context) = _Started;

  const factory ArticleEvent.load({Completer<void>? completer}) = _Load;
}
