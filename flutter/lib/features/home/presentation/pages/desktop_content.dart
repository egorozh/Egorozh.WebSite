import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverGrid.count(
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 6,
            childAspectRatio: 1.3,
            children: const [
              TileIconButton(icon: Icons.video_collection),
              TileTextButton(text: "Обо мне"),
              TileTextButton(text: "Мои проекты"),
              TileTextButton(text: "Блог"),
              TileTextButton(text: "Контакты"),
              TileIconButton(icon: Icons.hub),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(80),
            child: Center(child: WelcomeText()),
          ),
        ),
      ],
    );
  }
}
