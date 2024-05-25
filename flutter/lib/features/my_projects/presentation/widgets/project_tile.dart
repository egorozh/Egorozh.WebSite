import 'package:egorozh_cv/core/ui/screen_type.dart';
import 'package:flutter/material.dart';

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
    return switch (screenType) {
      ScreenType.desktop => _DesktopTile(title: title, description: description, onTap: onTap),
      _ => _MobileTile(title: title, description: description, onTap: onTap),
    };
  }
}

class _DesktopTile extends StatelessWidget {
  const _DesktopTile({
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
              child: const Text("Перейти"),
            )
          ],
        ),
      ),
    );
  }
}

class _MobileTile extends StatelessWidget {
  const _MobileTile({
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
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
      ),
    );
  }
}
