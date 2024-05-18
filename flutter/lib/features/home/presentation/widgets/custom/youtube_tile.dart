import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../widgets.dart';

class YoutubeTile extends StatelessWidget {
  const YoutubeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TileIconButton(assetName: Assets.icons.youtube);
  }
}
