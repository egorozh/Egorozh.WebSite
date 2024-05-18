import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/widgets.dart';
import 'desktop_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return switch (AdaptiveHelper.getScreenType(context)) {
            ScreenType.watch => const _WatchContent(),
            ScreenType.handset => const _MobileContent(),
            ScreenType.tablet => const _MiddleContent(),
            ScreenType.desktop => const DesktopContent(),
          };
        },
      ),
    );
  }
}

class _WatchContent extends StatelessWidget {
  const _WatchContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverGrid.count(
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 2,
            children: const [
              YoutubeTile(),
              TileTextButton(text: "Обо мне"),
              TileTextButton(text: "Мои проекты"),
              TileTextButton(text: "Блог"),
              TileTextButton(text: "Контакты"),
              GithubTile(),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Center(child: WelcomeText()),
          ),
        ),
      ],
    );
  }
}

class _MobileContent extends StatelessWidget {
  const _MobileContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverGrid.count(
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 2,
            children: const [
              YoutubeTile(),
              TileTextButton(text: "Обо мне"),
              TileTextButton(text: "Мои проекты"),
              TileTextButton(text: "Блог"),
              TileTextButton(text: "Контакты"),
              GithubTile(),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: WelcomeText()),
          ),
        ),
      ],
    );
  }
}

class _MiddleContent extends StatelessWidget {
  const _MiddleContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverGrid.count(
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 3,
            children: const [
              YoutubeTile(),
              TileTextButton(text: "Обо мне"),
              TileTextButton(text: "Мои проекты"),
              TileTextButton(text: "Блог"),
              TileTextButton(text: "Контакты"),
              GithubTile(),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(48),
            child: Center(child: WelcomeText()),
          ),
        ),
      ],
    );
  }
}
