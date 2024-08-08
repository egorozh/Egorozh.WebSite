import 'package:flutter/material.dart';

import '../../../localization.dart';

class FailureContent extends StatelessWidget {
  const FailureContent({
    super.key,
    required this.tryAgainAction,
  });

  final Function() tryAgainAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context.appTexts.core.failure_content.load_error),
        FilledButton(
          onPressed: tryAgainAction,
          child: Text(context.appTexts.core.failure_content.try_again),
        ),
      ],
    );
  }
}
