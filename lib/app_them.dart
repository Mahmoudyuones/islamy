import 'package:flutter/material.dart';

class AppThem {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color black = Color(0xff242424);
  static const Color gold = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30, color: black, fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: lightPrimary,
        selectedItemColor: black,
        unselectedItemColor: white,
      ));
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
  );
}
