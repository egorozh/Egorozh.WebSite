import 'package:egorozh_cv/core/domain/entities/domain_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

@LazySingleton(as: IBlogRepository)
class BlogRepository implements IBlogRepository {
  @override
  Future<CommonDomainResult<List<ArticleListInfo>>> getArticles() async {
    return Success([
      const ArticleListInfo(
        title: "Первый взгляд на переход с Xamarin Native на Flutter",
        description:
            "Это история о переходе с Xamarin Native на Flutter. В ней я постараюсь сравнить оба фреймворка с точки зрения личного опыта. Также в качестве лирического отступления в конце статьи порассуждаю о своём идеальном мобильном фреймворке мечты.",
      )
    ]);
  }
}
