import '../../../../core/core.dart';
import '../domain.dart';

abstract interface class IBlogRepository {
  Future<CommonDomainResult<List<ArticleListInfo>>> getArticles();
}
