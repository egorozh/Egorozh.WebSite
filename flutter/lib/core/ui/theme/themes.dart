import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF00FEEB),
    //secondary: const Color(0xFFFE0012),
    //surface: const Color(0xFF250036),
  ),
  useMaterial3: true,
);
