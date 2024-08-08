part of 'my_projects_bloc.dart';

@freezed
class MyProjectsState with _$MyProjectsState {
  const factory MyProjectsState.loading() = _Loading;

  const factory MyProjectsState.loaded(List<ProjectListInfo> projects) = _Loaded;

  const factory MyProjectsState.failure() = _Failure;
}
