import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../gen/assets.gen.dart';
import '../widgets.dart';

class GithubTile extends StatelessWidget {
  const GithubTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TileIconButton(
      assetName: Assets.icons.github,
      onTap: () {
        UrlHelper.open(myGithubUrl);
      },
    );
  }
}
