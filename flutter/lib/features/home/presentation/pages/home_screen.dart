import 'package:egorozh_cv/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.child, required this.location});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenType = AdaptiveHelper.getScreenType(context);

      return Scaffold(
        appBar: screenType == ScreenType.desktop ? AppBar(title: _DesktopAppBar(location)) : null,
        body: child,
        bottomNavigationBar: screenType != ScreenType.desktop ? _MobileNavBar(location) : null,
      );
    });
  }
}

class _DesktopAppBar extends StatelessWidget {
  const _DesktopAppBar(this.currentLocation);

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: currentLocation == Routes.homeRoute ? null : () => context.go(Routes.homeRoute),
          child: Text(context.appTexts.about),
        ),
        TextButton(
          onPressed: currentLocation == Routes.projectsRoute ? null : () => context.go(Routes.projectsRoute),
          child: Text(context.appTexts.projects),
        ),
        TextButton(
          onPressed: currentLocation == Routes.blogRoute ? null : () => context.go(Routes.blogRoute),
          child: Text(context.appTexts.blog),
        ),
        TextButton(
          onPressed: currentLocation == Routes.contactsRoute ? null : () => context.go(Routes.contactsRoute),
          child: Text(context.appTexts.contacts),
        ),
        TextButton.icon(
          label: Text(context.appTexts.youtube),
          icon: SvgPicture.asset(
            Assets.icons.youtube,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
          onPressed: () => UrlHelper.open(myYoutubeChannelUrl),
        ),
        TextButton.icon(
          label: Text(context.appTexts.github),
          icon: SvgPicture.asset(
            Assets.icons.github,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
          onPressed: () => UrlHelper.open(myGithubUrl),
        ),
      ],
    );
  }
}

class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar(this.currentLocation);

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      useLegacyColorScheme: false,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      currentIndex: switch (currentLocation) {
        Routes.homeRoute => 0,
        Routes.blogRoute => 1,
        Routes.projectsRoute => 2,
        Routes.contactsRoute => 3,
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
          0 => Routes.homeRoute,
          1 => Routes.blogRoute,
          2 => Routes.projectsRoute,
          3 => Routes.contactsRoute,
          _ => Routes.homeRoute,
        },
      ),
    );
  }
}
