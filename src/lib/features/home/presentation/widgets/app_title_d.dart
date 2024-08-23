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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in navItems) ...[
                NavigationItem(info: item, currentLocation: currentLocation, forDrawer: false),
                const SizedBox(width: 12),
              ],
            ],
          ),
        ),
        const Row(
          children: [
            ThemeSwitch(),
            SizedBox(width: 20),
            LangSwitch(),
            SizedBox(width: 20),
          ],
        )
      ],
    );
  }
}
