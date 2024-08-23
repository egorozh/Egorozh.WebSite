import 'package:egorozh_cv/localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/core.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = AdaptiveHelper.getScreenType(context);

    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(
        switch (screenType) {
          ScreenType.desktop => 80,
          ScreenType.tablet => 48,
          ScreenType.handset => 24,
          ScreenType.watch => 12,
        },
      ),
      child: _WelcomeText(screenType: screenType),
    ));
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({required this.screenType});

  final ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    final style = switch (screenType) {
      ScreenType.desktop => texts.displaySmall,
      _ => texts.headlineSmall,
    };

    final primaryStyle = style!.copyWith(color: Theme.of(context).colorScheme.primary);

    return Column(
      children: [
        Text.rich(
          context.appTexts.about.welcome_text(accent: (text) => TextSpan(text: text, style: primaryStyle)),
          style: style,
        )
      ],
    );
  }
}
