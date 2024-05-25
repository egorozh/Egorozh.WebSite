import 'package:egorozh_cv/localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = AdaptiveHelper.getScreenType(context);

    return Padding(
      padding: EdgeInsets.all(
        switch (screenType) {
          ScreenType.desktop => 80,
          ScreenType.tablet => 48,
          ScreenType.handset => 24,
          ScreenType.watch => 12,
        },
      ),
      child: SingleChildScrollView(child: _WelcomeText(screenType: screenType)),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({required this.screenType});

  final ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    final style = switch (screenType) {
      ScreenType.desktop => texts.displayMedium,
      _ => texts.headlineSmall,
    };

    final primaryStyle = style!.copyWith(color: Theme.of(context).colorScheme.primary);

    return Column(
      children: [
        Text.rich(
          textAlign: TextAlign.justify,
          TextSpan(
            children: [
              TextSpan(text: context.appTexts.welcome_text1, style: style),
              TextSpan(text: context.appTexts.welcome_text2, style: primaryStyle),
              TextSpan(text: "\n\n", style: style),
              TextSpan(text: context.appTexts.welcome_text_next_1, style: style),
              TextSpan(text: context.appTexts.welcome_text_next_2, style: primaryStyle),
              TextSpan(text: context.appTexts.welcome_text_next_3, style: style),
              TextSpan(text: context.appTexts.welcome_text_next_4, style: primaryStyle),
              TextSpan(text: context.appTexts.welcome_text_next_5, style: style),
              TextSpan(text: context.appTexts.welcome_text_next_6, style: primaryStyle),
              TextSpan(text: context.appTexts.welcome_text_next_7, style: style),
              TextSpan(text: context.appTexts.welcome_text_next_8, style: primaryStyle),
            ],
          ),
        ),
      ],
    );
  }
}
