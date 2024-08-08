import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';
import '../../../../router/router.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.child, required this.location});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final navItems = [
      PageInfo(text: context.appTexts.about.title, route: Routes.homeRoute),
      PageInfo(text: context.appTexts.my_projects.title, route: Routes.projectsRoute),
      PageInfo(text: context.appTexts.blog.title, route: Routes.blogRoute),
      PageInfo(text: context.appTexts.contacts, route: Routes.contactsRoute),
      ExternalUrlInfo(text: context.appTexts.youtube, assetName: Assets.icons.youtube, url: myYoutubeChannelUrl),
      ExternalUrlInfo(text: context.appTexts.github, assetName: Assets.icons.github, url: myGithubUrl),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = AdaptiveHelper.getScreenType(context);

        return Scaffold(
          appBar: screenType == ScreenType.desktop
              ? AppBar(
                  title: _DesktopAppBar(location, navItems),
                  leadingWidth: 24.0 + 48,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                    child: CircleAvatar(child: ClipOval(child: Assets.splash.image(fit: BoxFit.fitHeight))),
                  ),
                )
              : AppBar(),
          body: child,
          drawer: screenType != ScreenType.desktop ? _MobileDrawer(currentLocation: location, items: navItems) : null,
          bottomSheet: screenType == ScreenType.desktop ? const Padding(padding: EdgeInsets.all(8.0), child: _PoweredBy()) : null,
        );
      },
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  const _DesktopAppBar(this.currentLocation, this.navItems);

  final String currentLocation;
  final List<NavigationInfo> navItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final item in navItems) ...[
          NavigationItem(info: item, currentLocation: currentLocation, forDrawer: false),
          const SizedBox(width: 12),
        ],
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
  const _MobileDrawer({required this.currentLocation, required this.items});

  final String currentLocation;
  final List<NavigationInfo> items;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: DrawerHeader(
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
            ),
            SliverList.separated(
              itemBuilder: (context, index) => NavigationItem(info: items[index], currentLocation: currentLocation, forDrawer: true),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemCount: items.length,
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            const SliverToBoxAdapter(child: _PoweredBy()),
          ],
        ),
      ),
    );
  }
}

class _PoweredBy extends StatelessWidget {
  const _PoweredBy();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.appTexts.home.powered_by(version: "3.24.0"),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
