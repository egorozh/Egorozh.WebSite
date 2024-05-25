import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_list_info.freezed.dart';

@freezed
class ArticleListInfo with _$ArticleListInfo {
  const factory ArticleListInfo({
    required String title,
    required String description,
  }) = _ArticleListInfo;
}
