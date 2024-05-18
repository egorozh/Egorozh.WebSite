import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/widgets.dart';

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                TextButton(child: const Text("Обо мне"), onPressed: () {}),
                TextButton(child: const Text("Мои проекты"), onPressed: () {}),
                TextButton(child: const Text("Блог"), onPressed: () {}),
                TextButton(child: const Text("Контакты"), onPressed: () {}),
                TextButton.icon(
                  label: const Text("youtube"),
                  icon: SvgPicture.asset(
                    Assets.icons.youtube,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    js.context.callMethod('open', ['https://www.youtube.com/c/EgorozhCoding']);
                  },
                ),
                TextButton.icon(
                  label: const Text("github"),
                  icon: SvgPicture.asset(
                    Assets.icons.github,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    js.context.callMethod('open', ['https://github.com/egorozh']);
                  },
                ),
              ],
            ),
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
