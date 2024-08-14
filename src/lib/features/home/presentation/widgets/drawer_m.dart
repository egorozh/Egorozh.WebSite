import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';
import '../models/models.dart';
import 'widgets.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.currentLocation, required this.items});

  final String currentLocation;
  final List<NavigationInfo> items;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: _Header()),
            SliverList.separated(
              itemBuilder: (context, index) => NavigationItem(
                info: items[index],
                currentLocation: currentLocation,
                forDrawer: true,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemCount: items.length,
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            const SliverToBoxAdapter(child: PoweredByFlutter()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CircleAvatar(child: ClipOval(child: Assets.splash.image(fit: BoxFit.fitHeight))),
              ),
              Text(context.appTexts.title, textAlign: TextAlign.center),
            ],
          ),
          const Align(alignment: Alignment.topLeft, child: ThemeSwitch()),
          const Align(alignment: Alignment.topRight, child: LangSwitch()),
        ],
      ),
    );
  }
}
