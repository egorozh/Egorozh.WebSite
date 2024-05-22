import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/widgets.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.child, required this.location});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenType = AdaptiveHelper.getScreenType(context);
      return switch (screenType) {
        ScreenType.desktop => _DesktopContent(location: location, child: child),
        _ => _TileContent(child, screenType, location),
      };
    });
  }
}

class _DesktopContent extends StatelessWidget {
  const _DesktopContent({
    required this.location,
    required this.child,
  });

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DesktopAppBar(currentLocation: location)),
      body: child,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
            //TileNavBar(screenType, currentLocation: currentLocation),
          ],
        ),
      ),
    );
  }
}
