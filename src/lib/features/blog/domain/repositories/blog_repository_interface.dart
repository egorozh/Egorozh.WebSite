import '../../../../core/core.dart';
import '../domain.dart';

abstract interface class IBlogRepository {
  Future<CommonDomainResult<List<ArticleListInfo>>> getArticles(String locale);

  Future<CommonDomainResult<String>> getArticle(DomainId id, String locale);
}
