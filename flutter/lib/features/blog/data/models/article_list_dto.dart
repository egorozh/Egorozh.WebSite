import 'package:egorozh_cv/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'article_list_dto.g.dart';

@JsonSerializable()
class ArticleListDto {
  ArticleListDto(this.id, this.title, this.description);

  final int id;
  final String title;
  final String description;

  factory ArticleListDto.fromJson(Map<String, dynamic> json) => _$ArticleListDtoFromJson(json);

  ArticleListInfo toDomain() {
    return ArticleListInfo(
      title: title,
      description: description,
      id: DomainId.intId(id: id),
    );
  }
}
