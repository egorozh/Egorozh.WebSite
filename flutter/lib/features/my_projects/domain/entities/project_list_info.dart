import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_list_info.freezed.dart';

@freezed
class ProjectListInfo with _$ProjectListInfo {
  const factory ProjectListInfo({
    required String title,
    required String description,
    required String url,
  }) = _ProjectListInfo;
}
