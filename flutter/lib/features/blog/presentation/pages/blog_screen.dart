import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../locator/locator.dart';
import '../../../../router/router.dart';
import '../../domain/domain.dart';
import '../manager/blog_bloc.dart';
import '../widgets/widgets.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<BlogBloc>()..add(BlogEvent.started(context)),
      child: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) => state.map(
          loading: (s) => const Center(child: CircularProgressIndicator()),
          loaded: (s) => _LoadedContent(s.articles),
          failure: (s) => const _FailureContent(),
        ),
      ),
    );
  }
}

class _FailureContent extends StatelessWidget {
  const _FailureContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FailureContent(
        tryAgainAction: () {
          context.read<BlogBloc>().add(const BlogEvent.load());
        },
      ),
    );
  }
}

class _LoadedContent extends StatelessWidget {
  const _LoadedContent(this.articles);

  final List<ArticleListInfo> articles;

  @override
  Widget build(BuildContext context) {
    final screenType = AdaptiveHelper.getScreenType(context);

    final paddings = switch (screenType) {
      ScreenType.desktop => 24.0,
      _ => 12.0,
    };

    return Padding(
      padding: EdgeInsets.all(paddings),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final article = articles[index];

          return ArticleTile(
            title: article.title,
            description: article.description,
            onTap: () => context.go(Routes.articleRoute),
            screenType: screenType,
          );
        },
        separatorBuilder: (c, i) => SizedBox(height: paddings),
        itemCount: articles.length,
      ),
    );
  }
}
