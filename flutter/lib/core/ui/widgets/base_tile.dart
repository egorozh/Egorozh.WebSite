import 'package:flutter/material.dart';

import '../ui.dart';

class BaseTile extends StatelessWidget {
  const BaseTile({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.screenType,
    required this.buttonText,
  });

  final String title;
  final String description;
  final ScreenType screenType;
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return switch (screenType) {
      ScreenType.desktop => _DesktopTile(title: title, description: description, onTap: onTap, buttonText: buttonText),
      _ => _MobileTile(title: title, description: description, onTap: onTap),
    };
  }
}

class _DesktopTile extends StatelessWidget {
  const _DesktopTile({
    required this.title,
    required this.description,
    required this.onTap,
    required this.buttonText,
  });

  final String title;
  final String description;
  final String buttonText;
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
                  Text(
                    title,
                    style: texts.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description, style: texts.titleLarge),
                ],
              ),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: onTap,
              child: Text(buttonText),
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
              Text(
                title,
                style: texts.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(description, style: texts.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}
