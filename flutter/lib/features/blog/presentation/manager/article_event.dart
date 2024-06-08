part of 'article_bloc.dart';

@freezed
class ArticleEvent with _$ArticleEvent {
  const factory ArticleEvent.started(BuildContext context, DomainId id) = _Started;

  const factory ArticleEvent.load({Completer<void>? completer, String? locale}) = _Load;
}
