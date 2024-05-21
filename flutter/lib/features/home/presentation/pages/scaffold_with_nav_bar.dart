import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/widgets.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.child, required this.location});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenType = AdaptiveHelper.getScreenType(context);

            return switch (screenType) {
              ScreenType.desktop => CustomScrollView(slivers: [
                  SliverAppBar(
                    title: DesktopAppBar(currentLocation: location),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(child: child)
                ]),
              _ => _TileContent(child, screenType, location),
            };
          },
        ),
      ),
    );
  }
}

class _TileContent extends StatelessWidget {
  const _TileContent(this.child, this.screenType, this.currentLocation);

  final Widget child;
  final ScreenType screenType;
  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: child),
        TileNavBar(screenType, currentLocation: currentLocation),
      ],
    );
  }
}
