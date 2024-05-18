import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets.dart';

class TileTextButton extends StatelessWidget {
  const TileTextButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final style = switch (AdaptiveHelper.getScreenType(context)) {
      ScreenType.desktop => textTheme.titleMedium,
      ScreenType.tablet => textTheme.titleLarge,
      ScreenType.handset => textTheme.titleLarge,
      ScreenType.watch => textTheme.titleSmall,
    };

    return BaseTileButton(child: Text(text, textAlign: TextAlign.center, style: style));
  }
}

class TileIconButton extends StatelessWidget {
  const TileIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final double iconSize = switch (AdaptiveHelper.getScreenType(context)) {
      ScreenType.desktop => 48,
      ScreenType.tablet => 80,
      ScreenType.handset => 48,
      ScreenType.watch => 24,
    };

    return BaseTileButton(child: Icon(icon, size: iconSize));
  }
}
