import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightThemeColor = ThemeData(
    primaryColorLight: Colors.yellow,
    appBarTheme: const AppBarTheme(color: Colors.yellow),
    primaryTextTheme: const TextTheme(displayMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700
    )),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.yellow),
        elevation: MaterialStateProperty.all(2)
      )
    )
  );

  static ThemeData darkThemeColor = ThemeData(
    primaryColorDark: Colors.blue,
    appBarTheme: const AppBarTheme(color: Colors.blue),
    primaryTextTheme: const TextTheme(displayMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700
    )),
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        elevation: MaterialStateProperty.all(2),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        // textStyle: MaterialStateProperty.all(Colors.white as TextStyle?)
      )
    )
  );
}