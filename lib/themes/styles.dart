// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

class AppTheme {
  // Custom text theme
  static final customTextTheme = TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      fontSize: 24,
    ),
  );

  // light theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'IBMPlexSansThai',
    textTheme: customTextTheme,
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    hoverColor: divider,
    hintColor: accent,
    colorScheme: const ColorScheme.light(primary: primary),
    iconTheme: const IconThemeData(color: primaryText),
    scaffoldBackgroundColor: icons,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'IBMPlexSansThai',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      backgroundColor: primary,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
    ),
  );

  // dark theme
  static final ThemeData darkTheme = ThemeData(
      fontFamily: 'IBMPlexSansThai',
      textTheme: customTextTheme,
      primaryColor: primary,
      primaryColorDark: primaryDark,
      primaryColorLight: primaryLight,
      hoverColor: divider,
      hintColor: accent,
      colorScheme: const ColorScheme.dark(primary: icons),
      iconTheme: const IconThemeData(color: primaryText),
      scaffoldBackgroundColor: primaryText,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPlexSansThai',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: primaryText,
        foregroundColor: icons,
        iconTheme: IconThemeData(color: icons),
      ));
}
