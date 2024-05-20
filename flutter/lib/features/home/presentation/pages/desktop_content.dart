import 'package:egorozh_cv/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../router/router.dart';
import '../widgets/widgets.dart';

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                TextButton(child: Text(context.appTexts.about), onPressed: () {}),
                TextButton(child: Text(context.appTexts.projects), onPressed: () {}),
                TextButton(child: Text(context.appTexts.blog), onPressed: () {}),
                TextButton(child: Text(context.appTexts.contacts), onPressed: () => context.go(contactsRoute)),
                TextButton.icon(
                  label: Text(context.appTexts.youtube),
                  icon: SvgPicture.asset(
                    Assets.icons.youtube,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    UrlHelper.open(myYoutubeChannelUrl);
                  },
                ),
                TextButton.icon(
                  label: Text(context.appTexts.github),
                  icon: SvgPicture.asset(
                    Assets.icons.github,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    UrlHelper.open(myGithubUrl);
                  },
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(80),
            child: Center(child: WelcomeText()),
          ),
        ),
      ],
    );
  }
}
