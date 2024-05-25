part of 'my_projects_bloc.dart';

@freezed
class MyProjectsEvent with _$MyProjectsEvent {
  const factory MyProjectsEvent.started(BuildContext context) = _Started;

  const factory MyProjectsEvent.load({Completer<void>? completer}) = _Load;
}
