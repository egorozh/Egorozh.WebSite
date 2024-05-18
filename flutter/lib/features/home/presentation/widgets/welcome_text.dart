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
              TextSpan(text: "Всем привет!\r\nМеня зовут ", style: style),
              TextSpan(text: " Егор!", style: primaryStyle),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                  text:
                      "\t\tЯ являюсь разработчиком мобильных и десктопных приложений. Мой карьерный путь начался с 2018 года. Начинал с разработки векторного редактора на",
                  style: style),
              TextSpan(text: " WPF", style: primaryStyle),
              TextSpan(
                  text:
                      ", предназначенного для моделирования систем безопасности.\n\n\t\tЗатем разрабатывал крупное мобильное приложение на",
                  style: style),
              TextSpan(text: " Xamarin Native", style: primaryStyle),
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
