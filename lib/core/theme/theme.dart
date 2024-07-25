import 'package:flutter/material.dart';
import 'package:sound_of_memes/core/theme/pallate.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(Pallete.borderColor),
      border: _border(Pallete.borderColor),
      // errorBorder: _border(Pallete.errorColor),
      focusedBorder: _border(Pallete.gradient2),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Pallete.backgroundColor,
    ),
  );
}
