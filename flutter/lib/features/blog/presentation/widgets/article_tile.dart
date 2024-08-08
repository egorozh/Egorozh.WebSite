import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../localization.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.screenType,
  });

  final String title;
  final String description;
  final ScreenType screenType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BaseTile(
      title: title,
      description: description,
      onTap: onTap,
      screenType: screenType,
      buttonText: context.appTexts.blog.blog_screen.article_tile.read_more,
    );
  }
}
