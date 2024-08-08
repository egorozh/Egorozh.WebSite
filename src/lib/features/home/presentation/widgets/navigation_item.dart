import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../models/models.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({super.key, required this.info, required this.currentLocation, required this.forDrawer});

  final String currentLocation;
  final NavigationInfo info;
  final bool forDrawer;

  @override
  Widget build(BuildContext context) {
    return switch (info) {
      PageInfo(:final route, :final text) => TextButton(
          onPressed: currentLocation == route ? null : () => navigateAndCloseDrawer(context, route),
          child: Text(text),
        ),
      ExternalUrlInfo(:final text, :final assetName, :final url) => TextButton.icon(
          label: Text(text),
          icon: SvgPicture.asset(
            assetName,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
          onPressed: () => UrlHelper.open(url),
        ),
    };
  }

  void navigateAndCloseDrawer(BuildContext context, String route) {
    context.go(route);

    if (forDrawer) Navigator.pop(context);
  }
}
