// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectListDto _$ProjectListDtoFromJson(Map<String, dynamic> json) =>
    ProjectListDto(
      json['title'] as String,
      json['description'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$ProjectListDtoToJson(ProjectListDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
    };
