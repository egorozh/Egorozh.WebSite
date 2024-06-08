import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../core/core.dart';
import '../../../../locator/locator.dart';
import '../manager/article_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.id});

  final DomainId id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ArticleBloc>()..add(ArticleEvent.started(context, id)),
      child: BlocListener<AppCubit, AppState>(
        listenWhen: (prev, next) => prev.locale != next.locale,
        listener: (context, state) => context.read<ArticleBloc>().add(ArticleEvent.load(locale: state.locale.languageCode)),
        child: Scaffold(
          body: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) => state.map(
              loading: (s) => const Center(child: CircularProgressIndicator()),
              loaded: (s) => _LoadedContent(s.markdownData),
              failure: (s) => const _FailureContent(),
            ),
          ),
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
      child: Column(
        children: [
          const Text("Ошибка загрузки"),
          FilledButton(
            onPressed: () {
              context.read<ArticleBloc>().add(const ArticleEvent.load());
            },
            child: const Text("Попробовать снова"),
          ),
        ],
      ),
    );
  }
}

class _LoadedContent extends StatelessWidget {
  const _LoadedContent(this.markdownData);

  final String markdownData;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      selectable: true,
      data: markdownData,
    );
  }
}
