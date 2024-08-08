import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../blog.dart';

@LazySingleton(as: IBlogRepository)
class BlogRepository implements IBlogRepository {
  final BlogApi _blogApi;

  BlogRepository(this._blogApi);

  @override
  Future<CommonDomainResult<List<ArticleListInfo>>> getArticles(String locale) async {
    try {
      final apiResult = await _blogApi.getArticles(locale);
      return Success(apiResult.map((m) => m.toDomain()).toList());
    } on Exception catch (_) {
      return Error(DomainErrorType.serverError);
    }
  }

  @override
  Future<CommonDomainResult<String>> getArticle(DomainId id, String locale) async {
    try {
      final apiResult = await _blogApi.getArticle(id.toInt(), locale);
      return Success(apiResult);
    } on Exception catch (_) {
      return Error(DomainErrorType.serverError);
    }
  }
}
