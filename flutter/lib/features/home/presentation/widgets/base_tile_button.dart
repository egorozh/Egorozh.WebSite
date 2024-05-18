import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class BaseTileButton extends StatelessWidget {
  const BaseTileButton({
    super.key,
    required this.child,
    this.device = ScreenType.handset,
    required this.onTap,
  });

  final ScreenType device;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
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
          child: child,
        ),
      ),
    );
  }
}
