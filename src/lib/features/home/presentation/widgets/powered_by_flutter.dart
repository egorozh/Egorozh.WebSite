import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../localization.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.appTexts.home.powered_by(version: flutterVersion),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
