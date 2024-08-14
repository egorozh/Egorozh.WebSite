import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../models/models.dart';
import 'widgets.dart';

class AppTitle extends StatelessWidget {
  const AppTitle(this.currentLocation, this.navItems, {super.key});

  final String currentLocation;
  final List<NavigationInfo> navItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final item in navItems) ...[
          NavigationItem(info: item, currentLocation: currentLocation, forDrawer: false),
          const SizedBox(width: 12),
        ],
        const Spacer(),
        const ThemeSwitch(),
        const SizedBox(width: 20),
        const LangSwitch(),
        const SizedBox(width: 20),
      ],
    );
  }
}
