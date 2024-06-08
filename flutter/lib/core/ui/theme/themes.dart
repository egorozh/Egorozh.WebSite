import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _textTheme = TextTheme(
  displayLarge: GoogleFonts.ubuntu(),
  displayMedium: GoogleFonts.ubuntu(),
  displaySmall: GoogleFonts.ubuntu(),
  headlineSmall: GoogleFonts.ubuntu(),
  headlineMedium: GoogleFonts.ubuntu(),
  titleLarge: GoogleFonts.roboto(),
  bodyMedium: GoogleFonts.roboto(),
);

final lightTheme = ThemeData(
  textTheme: _textTheme,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xFF00FEEB),
    //secondary: const Color(0xFFFE0012),
    //surface: const Color(0xFF250036),
  ),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  textTheme: _textTheme,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF00FEEB),
    //secondary: const Color(0xFFFE0012),
    //surface: const Color(0xFF250036),
  ),
  useMaterial3: true,
);
