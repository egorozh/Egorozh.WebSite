import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../../../../localization.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.screenType,
  });

  final String title;
  final String description;
  final ScreenType screenType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BaseTile(
      title: title,
      description: description,
      onTap: onTap,
      screenType: screenType,
      buttonText: context.appTexts.my_projects.projects_screen.project_tile.go,
    );
  }
}
