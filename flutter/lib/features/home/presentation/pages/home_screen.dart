import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      child: SingleChildScrollView(child: WelcomeText(screenType: screenType)),
    );
  }
}
