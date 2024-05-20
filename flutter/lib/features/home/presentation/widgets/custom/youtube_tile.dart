import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../gen/assets.gen.dart';
import '../widgets.dart';

class YoutubeTile extends StatelessWidget {
  const YoutubeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TileIconButton(
      assetName: Assets.icons.youtube,
      onTap: () {
        UrlHelper.open(myYoutubeChannelUrl);
      },
    );
  }
}
