part of 'blog_bloc.dart';

@freezed
class BlogEvent with _$BlogEvent {
  const factory BlogEvent.started(BuildContext context) = _Started;

  const factory BlogEvent.load({Completer<void>? completer, String? locale}) = _Load;
}
