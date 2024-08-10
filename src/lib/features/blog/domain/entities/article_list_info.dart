import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';

part 'article_list_info.freezed.dart';

@freezed
class ArticleListInfo with _$ArticleListInfo {
  const factory ArticleListInfo({
    required DomainId id,
    required String? url,
    required String title,
    required String description,
  }) = _ArticleListInfo;
}
