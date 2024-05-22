import 'package:egorozh_cv/localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../router/router.dart';
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

class _TileContent extends StatefulWidget {
  const _TileContent(this.child, this.screenType, this.currentLocation);

  final Widget child;
  final ScreenType screenType;
  final String currentLocation;

  @override
  State<_TileContent> createState() => _TileContentState();
}

class _TileContentState extends State<_TileContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        currentIndex: switch (widget.currentLocation) {
          homeRoute => 0,
          blogRoute => 1,
          projectsRoute => 2,
          contactsRoute => 3,
          _ => 0,
        },
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: context.appTexts.about),
          BottomNavigationBarItem(icon: const Icon(Icons.book), label: context.appTexts.blog),
          BottomNavigationBarItem(icon: const Icon(Icons.work), label: context.appTexts.projects),
          BottomNavigationBarItem(icon: const Icon(Icons.contacts), label: context.appTexts.contacts),
        ],
        onTap: (index) => context.go(
          switch (index) {
            0 => homeRoute,
            1 => blogRoute,
            2 => projectsRoute,
            3 => contactsRoute,
            _ => homeRoute,
          },
        ),
      ),
    );
  }
}
