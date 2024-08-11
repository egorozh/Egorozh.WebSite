import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconButtonInfos = [
      (
        title: myEmail,
        iconPath: null,
        icon: Icons.alternate_email,
        onPressed: () => UrlHelper.open('mailto:$myEmail'),
      ),
      (
        title: context.appTexts.contacts.linkedin,
        iconPath: Assets.icons.linkedin,
        icon: null,
        onPressed: () => UrlHelper.open(myLinkedinUrl),
      ),
      (
        title: context.appTexts.contacts.youtube,
        iconPath: Assets.icons.youtube,
        icon: null,
        onPressed: () => UrlHelper.open(myYoutubeChannelUrl)
      ),
      (
        title: context.appTexts.contacts.github,
        iconPath: Assets.icons.github,
        icon: null,
        onPressed: () => UrlHelper.open(myGithubUrl),
      ),
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(iconButtonInfos.length * 2, (index) {
          if (index.isEven) return const SizedBox(height: 12);

          final iconButtonInfo = iconButtonInfos[index ~/ 2];

          return TextButton.icon(
            onPressed: iconButtonInfo.onPressed,
            label: Text(iconButtonInfo.title),
            icon: iconButtonInfo.icon == null
                ? _Icon(iconButtonInfo.iconPath!)
                : Icon(iconButtonInfo.icon!, color: Theme.of(context).colorScheme.secondary),
          );
        }),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon(this.assetPath);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
      width: 24,
      height: 24,
    );
  }
}
