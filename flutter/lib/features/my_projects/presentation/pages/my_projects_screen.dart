import 'package:egorozh_cv/features/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../locator/locator.dart';
import '../../domain/domain.dart';
import '../manager/my_projects_bloc.dart';
import '../widgets/widgets.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<MyProjectsBloc>()..add(MyProjectsEvent.started(context)),
      child: BlocListener<LangCubit, LangState>(
        listenWhen: (prev, next) => prev.selectedLocale != next.selectedLocale,
        listener: (context, state) => context.read<MyProjectsBloc>().add(MyProjectsEvent.load(locale: state.selectedLocale?.code)),
        child: BlocBuilder<MyProjectsBloc, MyProjectsState>(
          builder: (context, state) {
            return state.map(
              loading: (s) => const Center(child: CircularProgressIndicator()),
              loaded: (s) => _LoadedContent(projects: s.projects),
              failure: (s) => const _FailureContent(),
            );
          },
        ),
      ),
    );
  }
}

class _LoadedContent extends StatelessWidget {
  const _LoadedContent({required this.projects});

  final List<ProjectListInfo> projects;

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
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];

          return ProjectTile(
            title: project.title,
            description: project.description,
            onTap: () => UrlHelper.open(project.url),
            screenType: screenType,
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: paddings),
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
