import 'package:brave/src/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Quicksand',
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            side: MaterialStateProperty.all(const BorderSide(
                color: Colors.white, width: 2.0, style: BorderStyle.solid)))),
    colorScheme: const ColorScheme.light(
        primary: Colors.white,
        inversePrimary: Colors.black,
        onPrimary: Colors.black,
        secondary: Color(0xFF977934),
        surface: Colors.green,
        onSecondary: Colors.white,
        shadow: Colors.black,
        secondaryContainer: Colors.white70),
    cardTheme: const CardTheme(
      color: Color(0xFF977934),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(
          color: CustomColors.deepGoldColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w700),
      displayLarge: TextStyle(
          color: Colors.black, fontSize: 35.0, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
          color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
      ),
      titleLarge: TextStyle(
          color: Colors.white70, fontSize: 16.0, fontWeight: FontWeight.w700),
      bodySmall: TextStyle(
          color: CustomColors.deepGoldColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w700),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Quicksand',
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Color(0xFF977934),
      ),
    ),
    colorScheme: ColorScheme.dark(
        primary: Colors.grey.shade900,
        onPrimary: Colors.white,
        secondary: const Color(0xFF977934),
        onSecondary: Colors.white,
        shadow: Colors.black,
        surface: Colors.green,
        inversePrimary: Colors.black,
        secondaryContainer: Colors.green),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(
          color: CustomColors.deepGoldColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w700),
      displayLarge: TextStyle(
          color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Colors.white70, fontSize: 18.0, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      ),
      bodySmall: TextStyle(
          color: CustomColors.deepGoldColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w700),
      titleLarge: TextStyle(
          color: Colors.white70, fontSize: 16.0, fontWeight: FontWeight.w700),
    ),
  );
}
