import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import 'widgets.dart';

class TileTextButton extends StatelessWidget {
  const TileTextButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final GestureTapCallback? onTap;

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
      onTap: onTap,
      child: Center(
        child: Text(text, textAlign: TextAlign.center, style: style),
      ),
    );
  }
}

class TileIconButton extends StatelessWidget {
  const TileIconButton({
    super.key,
    required this.assetName,
    required this.onTap,
  });

  final String assetName;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseTileButton(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
      ),
    );
  }
}