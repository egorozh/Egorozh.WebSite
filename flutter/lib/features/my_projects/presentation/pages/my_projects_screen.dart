import 'package:egorozh_cv/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../manager/my_projects_bloc.dart';
import '../widgets/widgets.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<MyProjectsBloc>()..add(MyProjectsEvent.started(context)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<MyProjectsBloc, MyProjectsState>(
          builder: (context, state) {
            return state.map(
              loading: (s) => const Center(child: CircularProgressIndicator()),
              loaded: (s) => ListView.separated(
                itemCount: s.projects.length,
                itemBuilder: (context, index) {
                  final project = s.projects[index];

                  return ProjectTile(
                    title: project.title,
                    description: project.description,
                    onTap: () => UrlHelper.open(project.url),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 24),
              ),
              failure: (s) => const _FailureContent(),
            );
          },
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
          context.read<MyProjectsBloc>().add(const MyProjectsEvent.load());
        },
      ),
    );
  }
}
