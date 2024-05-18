import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/features.dart';

void main() {
  runApp(const EgorozhApp());
}

class EgorozhApp extends StatelessWidget {
  const EgorozhApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Желудков Егор',
      theme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
