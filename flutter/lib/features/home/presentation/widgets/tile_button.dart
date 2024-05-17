import 'package:flutter/material.dart';

import '../../../../core/core.dart';

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

    return BaseTileButton(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
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

    return BaseTileButton(
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}

class BaseTileButton extends StatelessWidget {
  const BaseTileButton({
    super.key,
    required this.child,
    this.device = ScreenType.handset,
  });

  final ScreenType device;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(0),
          ),
          padding: EdgeInsets.all(switch (device) {
            ScreenType.desktop => 24,
            ScreenType.tablet => 48,
            ScreenType.handset => 12,
            ScreenType.watch => 8,
          }),
          child: Center(child: child),
        ),
      ),
    );
  }
}
