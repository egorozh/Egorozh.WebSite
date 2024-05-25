import 'package:egorozh_cv/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../manager/blog_bloc.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlogBloc()..add(BlogEvent.started(context)),
      child: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) => state.map(
          loading: (s) => const Center(child: CircularProgressIndicator()),
          loaded: (s) => _LoadedContent(s.markdownData),
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
  const _LoadedContent(this.markdownData);

  final String markdownData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ArticleTile(
            title: "Первый взгляд на переход с Xamarin Native на Flutter",
            description:
                "Это история о переходе с Xamarin Native на Flutter. В ней я постараюсь сравнить оба фреймворка с точки зрения личного опыта. Также в качестве лирического отступления в конце статьи порассуждаю о своём идеальном мобильном фреймворке мечты.",
            onTap: () => context.go(Routes.articleRoute),
          );
        },
        separatorBuilder: (c, i) => const SizedBox(height: 12),
        itemCount: 1,
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String description;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: texts.headlineMedium),
                  const SizedBox(height: 8),
                  Text(description, style: texts.titleLarge),
                ],
              ),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: onTap,
              child: const Text("Читать далее"),
            )
          ],
        ),
      ),
    );
  }
}
