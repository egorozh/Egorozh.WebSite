import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';
import '../../../../router/router.dart';
import 'widgets.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({
    super.key,
    required this.currentLocation,
  });

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: currentLocation == homeRoute ? null : () => context.go(homeRoute),
          child: Text(context.appTexts.about),
        ),
        TextButton(child: Text(context.appTexts.projects), onPressed: () {}),
        TextButton(
          onPressed: currentLocation == blogRoute ? null : () => context.go(blogRoute),
          child: Text(context.appTexts.blog),
        ),
        TextButton(
          onPressed: currentLocation == contactsRoute ? null : () => context.go(contactsRoute),
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
        TileTextButton(text: context.appTexts.about, onTap: currentLocation == homeRoute ? null : () => context.go(homeRoute)),
        TileTextButton(text: context.appTexts.projects, onTap: null),
        TileTextButton(text: context.appTexts.blog, onTap: currentLocation == blogRoute ? null : () => context.go(blogRoute)),
        TileTextButton(text: context.appTexts.contacts, onTap: currentLocation == contactsRoute ? null : () => context.go(contactsRoute)),
        const GithubTile(),
      ],
    );
  }
}
