import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

@injectable
class GetArticles {
  final IBlogRepository _blogRepository;

  GetArticles(this._blogRepository);

  Future<CommonDomainResult<List<ArticleListInfo>>> call() => _blogRepository.getArticles();
}
