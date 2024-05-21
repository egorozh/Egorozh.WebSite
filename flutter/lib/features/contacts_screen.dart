import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      children: [
        _Tile(color: colorScheme.primary, text: 'primary'),
        _Tile(color: colorScheme.onPrimary, text: 'onPrimary'),
        _Tile(color: colorScheme.secondary, text: 'secondary'),
        _Tile(color: colorScheme.onSecondary, text: 'onSecondary'),
        _Tile(color: colorScheme.error, text: 'error'),
        _Tile(color: colorScheme.onError, text: 'onError'),
        _Tile(color: colorScheme.surface, text: 'surface'),
        _Tile(color: colorScheme.onSurface, text: 'onSurface'),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(48),
      child: Center(child: Text(text)),
    );
  }
}
