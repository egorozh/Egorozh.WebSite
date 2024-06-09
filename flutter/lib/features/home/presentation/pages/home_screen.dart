import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';
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
          appBar: screenType == ScreenType.desktop
              ? AppBar(
                  title: _DesktopAppBar(location),
                  leadingWidth: 24.0 + 48,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                    child: CircleAvatar(child: ClipOval(child: Assets.splash.image(fit: BoxFit.fitHeight))),
                  ),
                )
              : AppBar(),
          body: child,
          drawer: screenType != ScreenType.desktop ? _MobileDrawer(currentLocation: location) : null,
          bottomSheet: screenType == ScreenType.desktop ? const Padding(padding: EdgeInsets.all(8.0), child: _PoweredBy()) : null,
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

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.currentLocation});

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CircleAvatar(child: ClipOval(child: Assets.splash.image(fit: BoxFit.fitHeight))),
                        ),
                        Text(context.appTexts.title, textAlign: TextAlign.center),
                      ],
                    ),
                    const Align(alignment: Alignment.topLeft, child: ThemeSwitch()),
                    const Align(alignment: Alignment.topRight, child: LangSwitch()),
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
              const SizedBox(height: 48),
              const _PoweredBy(),
            ],
          ),
        ),
      ),
    );
  }

  void navigateAndCloseDrawer(BuildContext context, String route) {
    context.go(route);

    Navigator.pop(context);
  }
}

class _PoweredBy extends StatelessWidget {
  const _PoweredBy();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.appTexts.powered_by,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
