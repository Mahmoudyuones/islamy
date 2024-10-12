import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backgrounImageName => isDark ? 'home_dark_background' : 'bg3';

  String get sebhaImageName => isDark ? 'body of seb7a gold' : 'body of seb7a';

  String get headSebhaImageName =>
      isDark ? 'head of seb7a gold' : 'head of seb7a';

  void changeTheme(ThemeMode selectedthemeMode) {
    if (selectedthemeMode == themeMode) return;
    themeMode = selectedthemeMode;
    notifyListeners();
  }

  void changelanguage(String selectdLanguage) {
    if (selectdLanguage == languageCode) return;
    languageCode = selectdLanguage;
    notifyListeners();
  }
}
