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
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(text: context.appTexts.welcome_text1, style: style),
              TextSpan(text: context.appTexts.welcome_text2, style: primaryStyle),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(text: context.appTexts.welcome_text_next_1, style: style),
              TextSpan(text: context.appTexts.welcome_text_next_2, style: primaryStyle),
              TextSpan(text: context.appTexts.welcome_text_next_3, style: style),
              TextSpan(text: context.appTexts.welcome_text_next_4, style: primaryStyle),
              TextSpan(text: ". C конца 2023 года переключился на разработку мобильного приложения на", style: style),
              TextSpan(text: " Flutter", style: primaryStyle),
              TextSpan(text: ", на котором и сделан данный сайт-визитка", style: style),
              TextSpan(text: "))", style: primaryStyle),
            ],
          ),
        ),
      ],
    );
  }
}
