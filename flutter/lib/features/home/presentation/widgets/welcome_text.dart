import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    final style = switch (AdaptiveHelper.getScreenType(context)) {
      ScreenType.desktop => texts.displayLarge,
      ScreenType.tablet => texts.displayLarge,
      ScreenType.handset => texts.displayMedium,
      ScreenType.watch => texts.displaySmall,
    };

    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(text: "Всем привет!\r\nМеня зовут ", style: style),
          TextSpan(text: " Егор!", style: style?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }
}
