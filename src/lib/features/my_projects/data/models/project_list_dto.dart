import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'project_list_dto.g.dart';

@JsonSerializable()
class ProjectListDto {
  ProjectListDto(this.title, this.description, this.url);

  final String title;
  final String description;
  final String url;

  factory ProjectListDto.fromJson(Map<String, dynamic> json) => _$ProjectListDtoFromJson(json);

  ProjectListInfo toDomain() {
    return ProjectListInfo(
      title: title,
      description: description,
      url: url,
    );
  }
}
