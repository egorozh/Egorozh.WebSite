import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

@injectable
class GetArticle {
  final IBlogRepository _blogRepository;

  GetArticle(this._blogRepository);

  Future<CommonDomainResult<String>> call(DomainId id, String locale) => _blogRepository.getArticle(id, locale);
}
