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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = AdaptiveHelper.getScreenType(context);

        return Scaffold(
          appBar: screenType == ScreenType.desktop ? AppBar(title: _DesktopAppBar(location)) : AppBar(),
          body: child,
          drawer: screenType != ScreenType.desktop ? _MobileDrawer(currentLocation: location) : null,
        );
      },
    );
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
        const Spacer(),
        const ThemeSwitch(),
        const SizedBox(width: 20),
        const LangSwitch(),
        const SizedBox(width: 20),
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

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.currentLocation});

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: CircleAvatar(child: ClipOval(child: Assets.splash.image(fit: BoxFit.fitHeight))),
                  ),
                  Text(context.appTexts.title, textAlign: TextAlign.center),
                ],
              ),
            ),
            TextButton(
              onPressed: currentLocation == Routes.homeRoute ? null : () => navigateAndCloseDrawer(context, Routes.homeRoute),
              child: Text(context.appTexts.about),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: currentLocation == Routes.projectsRoute ? null : () => navigateAndCloseDrawer(context, Routes.projectsRoute),
              child: Text(context.appTexts.projects),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: currentLocation == Routes.blogRoute ? null : () => navigateAndCloseDrawer(context, Routes.blogRoute),
              child: Text(context.appTexts.blog),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: currentLocation == Routes.contactsRoute ? null : () => navigateAndCloseDrawer(context, Routes.contactsRoute),
              child: Text(context.appTexts.contacts),
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
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
            const Spacer(),
            const ThemeSwitch(),
            const SizedBox(height: 24),
            const LangSwitch(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void navigateAndCloseDrawer(BuildContext context, String route) {
    context.go(route);

    Navigator.pop(context);
  }
}
