import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../localization.dart';
import '../../../../router/router.dart';
import 'widgets.dart';

class TileNavBar extends StatelessWidget {
  const TileNavBar(this.screenType, {super.key, required this.currentLocation});

  final ScreenType screenType;
  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      crossAxisCount: screenType == ScreenType.tablet ? 3 : 2,
      children: [
        const YoutubeTile(),
        TileTextButton(
            text: context.appTexts.about, onTap: currentLocation == Routes.homeRoute ? null : () => context.go(Routes.homeRoute)),
        TileTextButton(text: context.appTexts.projects, onTap: null),
        TileTextButton(text: context.appTexts.blog, onTap: currentLocation == Routes.blogRoute ? null : () => context.go(Routes.blogRoute)),
        TileTextButton(
            text: context.appTexts.contacts,
            onTap: currentLocation == Routes.contactsRoute ? null : () => context.go(Routes.contactsRoute)),
        const GithubTile(),
      ],
    );
  }
}
