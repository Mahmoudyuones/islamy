import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/home_screen.dart';
import 'package:islamy/taps/quran/sura_content_screen.dart';

void main() {
  runApp(Islamy());
}

class Islamy extends StatelessWidget {
  const Islamy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContentScreen.routeName: (_) => SuraContentScreen()
      },
      theme: AppThem.lightTheme,
      darkTheme: AppThem.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
