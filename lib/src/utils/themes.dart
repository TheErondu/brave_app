import 'package:flutter/material.dart';

ThemeData estatioLight = ThemeData(
  // Define the default brightness and colors.
  // useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.light,
      primary: const Color.fromARGB(255, 233, 237, 237),
      onPrimary: Colors.blueGrey[900],
      background: Colors.blue,
      tertiary: const Color.fromARGB(255, 46, 77, 92),
      onTertiary: Colors.blueGrey[100],
      onPrimaryContainer: Colors.blueGrey),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    elevation: 10,
    selectedLabelStyle: const TextStyle(
        color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0),
    unselectedLabelStyle: TextStyle(
        color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0),
    selectedItemColor: const Color.fromARGB(255, 45, 137, 183),
    unselectedItemColor: Colors.blueGrey[900],
    showUnselectedLabels: true,
  ),

  // Define the default font family.
  fontFamily: 'lato',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);

ThemeData estatioDark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 0, 111, 72),
      brightness: Brightness.dark,
      primary: const Color.fromARGB(255, 233, 237, 237),
      onPrimary: Colors.blueGrey[100],
      background: Colors.blue,
      tertiary: const Color.fromARGB(255, 46, 77, 92),
      onTertiary: Colors.blueGrey[100],
      onPrimaryContainer: Colors.blueGrey),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    elevation: 10,
    selectedLabelStyle: const TextStyle(
        color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0),
    unselectedLabelStyle: TextStyle(
        color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0),
    selectedItemColor: Colors.blueGrey[100],
    unselectedItemColor: Colors.blueGrey[400],
    showUnselectedLabels: true,
  ),

  // Define the default font family.
  fontFamily: 'Lato',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
bool isDarkMode = ThemeMode.system == Brightness.dark;

Color? bgColor = isDarkMode ? Colors.blueGrey[900] : Colors.blueGrey[100];
Color? iconColors = isDarkMode ? Colors.blueGrey[100] : Colors.blueGrey[900];
Color? unSelectedIconColors =
    isDarkMode ? Colors.blueGrey[100] : Colors.blueGrey[900];
Color? primaryColor = Colors.black;
Color? secondaryColor = Colors.blueGrey[900];
Color? textColor = Colors.blueGrey[900];
