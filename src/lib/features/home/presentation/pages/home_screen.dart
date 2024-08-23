import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      PageInfo(text: context.appTexts.contacts.title, route: Routes.contactsRoute),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = AdaptiveHelper.getScreenType(context);

        return Scaffold(
          appBar: screenType == ScreenType.desktop
              ? AppBar(
                  title: AppTitle(location, navItems),
                  leadingWidth: 24.0 + 48,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                    child: GestureDetector(
                      onTap: location == Routes.homeRoute ? null : () => context.go(Routes.homeRoute),
                      child: CircleAvatar(child: ClipOval(child: Assets.splash.image(fit: BoxFit.fitHeight))),
                    ),
                  ),
                )
              : AppBar(),
          body: child,
          drawer: screenType != ScreenType.desktop ? HomeDrawer(currentLocation: location, items: navItems) : null,
          bottomSheet: screenType == ScreenType.desktop ? const Padding(padding: EdgeInsets.all(8.0), child: PoweredByFlutter()) : null,
        );
      },
    );
  }
}
