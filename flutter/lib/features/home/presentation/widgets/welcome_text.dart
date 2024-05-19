import 'package:egorozh_cv/localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/core.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    final coreStyle = switch (AdaptiveHelper.getScreenType(context)) {
      ScreenType.desktop => texts.displayMedium,
      ScreenType.tablet => texts.headlineSmall,
      ScreenType.handset => texts.headlineSmall,
      ScreenType.watch => texts.headlineSmall,
    };

    final style = GoogleFonts.ubuntu(textStyle: coreStyle);

    final primaryStyle = style.copyWith(color: Theme.of(context).colorScheme.primary);

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
