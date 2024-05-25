import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => UrlHelper.open("tel:79818852110"),
              child: const Text("+7-981-885-21-10"),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => UrlHelper.open('mailto:$myEmail'),
              child: const Text(myEmail),
            ),
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
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
        ),
      ),
    );
  }
}
