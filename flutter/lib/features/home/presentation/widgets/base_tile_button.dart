import 'package:flutter/material.dart';

import '../../../../core/core.dart';

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
