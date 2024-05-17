import 'package:flutter/material.dart';

enum Device {
  mobile,
  middle,
  desktop,
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        final Device device = switch (screenWidth) {
          < 600.0 => Device.mobile,
          < 900.0 => Device.middle,
          _ => Device.desktop,
        };

        return switch (device) {
          Device.mobile => const _MobileContent(),
          Device.middle => const _MiddleContent(),
          Device.desktop => const _DesktopContent(),
        };
      }),
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
              TileIconButton(icon: Icons.video_collection),
              TileButton(text: "Обо мне"),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TileButton(text: "Secret tile"),
          ),
        ),
        SliverFillRemaining(
          child: GridView.count(
            primary: false,
            shrinkWrap: false,
            padding: const EdgeInsets.all(24),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 2,
            children: const [
              TileButton(text: "Мои проекты"),
              TileButton(text: "Блог"),
              TileButton(text: "Контакты"),
              TileIconButton(icon: Icons.hub),
            ],
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
              TileIconButton(icon: Icons.video_collection),
              TileButton(text: "Обо мне"),
              TileButton(text: "Мои проекты"),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Center(
                child: Text(
              "Всем привет!\r\nМеня зовут Егор!",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            )),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverGrid.count(
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 3,
            children: const [
              TileButton(text: "Блог"),
              TileButton(text: "Контакты"),
              TileIconButton(icon: Icons.hub),
            ],
          ),
        ),
      ],
    );
  }
}

class _DesktopContent extends StatelessWidget {
  const _DesktopContent();

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
              TileIconButton(device: Device.desktop, icon: Icons.video_collection),
              TileButton(device: Device.desktop, text: "Обо мне"),
              TileButton(device: Device.desktop, text: "Мои проекты"),
              TileButton(device: Device.desktop, text: "Блог"),
              TileButton(device: Device.desktop, text: "Контакты"),
              TileIconButton(device: Device.desktop, icon: Icons.hub),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Center(
                child: Text(
              "Всем привет!\r\nМеня зовут Егор!",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ],
    );
  }
}

class TileIconButton extends StatelessWidget {
  const TileIconButton({
    super.key,
    required this.icon,
    this.device = Device.mobile,
  });

  final IconData icon;
  final Device device;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      padding: EdgeInsets.all(device == Device.mobile ? 48 : 12),
      child: Icon(
        icon,
        size: 48,
      ),
    );
  }
}

class TileButton extends StatelessWidget {
  const TileButton({
    super.key,
    required this.text,
    this.device = Device.mobile,
  });

  final Device device;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(0),
          ),
          padding: EdgeInsets.all(device == Device.mobile ? 48 : 12),
          child: Center(
              child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          )),
        ),
      ),
    );
  }
}
