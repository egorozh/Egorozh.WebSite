import 'package:flutter/material.dart';

import '../core.dart';

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

class AdaptiveHelper {
  static ScreenType getScreenType(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.shortestSide;

    if (deviceWidth > FormFactor.desktop) return ScreenType.desktop;
    if (deviceWidth > FormFactor.tablet) return ScreenType.tablet;
    if (deviceWidth > FormFactor.handset) return ScreenType.handset;

    return ScreenType.watch;
  }
}
