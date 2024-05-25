import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
      child: Column(
        children: [
          const Text("Ошибка загрузки"),
          FilledButton(
            onPressed: () {
              context.read<BlogBloc>().add(const BlogEvent.load());
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
