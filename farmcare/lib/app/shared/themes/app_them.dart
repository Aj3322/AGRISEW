import 'package:flutter/material.dart';
import 'color_palette.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorPalette.primaryColor,
      primary: ColorPalette.primaryColor,
      secondary: ColorPalette.secondaryColor,
      background: ColorPalette.lightBackground,
      surface: ColorPalette.lightSurface,
      onPrimary: ColorPalette.onPrimaryColor,
      onSecondary: ColorPalette.onSecondaryColor,
      onBackground: ColorPalette.onLightBackground,
      onSurface: ColorPalette.onLightSurface,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: ColorPalette.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.primaryColor,
      foregroundColor: ColorPalette.onPrimaryColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorPalette.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ColorPalette.onLightBackground),
      bodyLarge: TextStyle(color: ColorPalette.onLightBackground),
      headlineMedium: TextStyle(color: ColorPalette.onPrimaryColor),
      headlineLarge: TextStyle(color: ColorPalette.onPrimaryColor),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorPalette.primaryColor,
      primary: ColorPalette.primaryColor,
      secondary: ColorPalette.secondaryColor,
      background: ColorPalette.darkBackground,
      surface: ColorPalette.darkSurface,
      onPrimary: ColorPalette.onPrimaryColor,
      onSecondary: ColorPalette.onSecondaryColor,
      onBackground: ColorPalette.onDarkBackground,
      onSurface: ColorPalette.onDarkSurface,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: ColorPalette.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.primaryColor,
      foregroundColor: ColorPalette.onPrimaryColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorPalette.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ColorPalette.onDarkBackground),
      bodyLarge: TextStyle(color: ColorPalette.onDarkBackground),
      headlineMedium: TextStyle(color: ColorPalette.onPrimaryColor),
      headlineLarge: TextStyle(color: ColorPalette.onPrimaryColor),
    ),
  );
}
