import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backgrounImageName => isDark ? 'home_dark_background' : 'bg3';

  String get sebhaImageName => isDark ? 'body of seb7a gold' : 'body of seb7a';

  String get headSebhaImageName =>
      isDark ? 'head of seb7a gold' : 'head of seb7a';

  Future<void> loadSettings() async {
    SharedPreferences presf = await SharedPreferences.getInstance();
    bool isDarkTheme = presf.getBool('is_dark_them') ?? false;
    String savedLanguage = presf.getString('Language_code') ?? 'en';
    themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    languageCode = savedLanguage;
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode selectedthemeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isdark = selectedthemeMode == ThemeMode.dark ? true : false;
    prefs.setBool('is_dark_them', isdark);

    if (selectedthemeMode == themeMode) return;

    themeMode = selectedthemeMode;
    notifyListeners();
  }

  Future<void> changelanguage(String selectdLanguage) async {
    if (selectdLanguage == languageCode) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Language_code', selectdLanguage);
    languageCode = selectdLanguage;
    notifyListeners();
  }
}
