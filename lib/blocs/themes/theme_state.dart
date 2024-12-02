import 'package:flutter/material.dart';

import '../../constant.dart';

abstract class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState()
      : super(
          ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: defPadding),
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              labelStyle: const TextStyle(fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defBorderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              outlineBorder: const BorderSide(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defBorderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        );
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(
          ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: defPadding),
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              labelStyle: const TextStyle(fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defBorderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              outlineBorder: const BorderSide(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defBorderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        );
}
