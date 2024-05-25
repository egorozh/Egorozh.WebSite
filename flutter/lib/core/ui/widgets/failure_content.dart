import 'package:flutter/material.dart';

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
        const Text("Ошибка загрузки"),
        FilledButton(
          onPressed: tryAgainAction,
          child: const Text("Попробовать снова"),
        ),
      ],
    );
  }
}
