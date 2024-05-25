import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
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
              child: const Text("Перейти"),
            )
          ],
        ),
      ),
    );
  }
}
