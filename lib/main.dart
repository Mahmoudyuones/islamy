import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/home_screen.dart';

void main() {
  runApp(Islamy());
}

class Islamy extends StatelessWidget {
  const Islamy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (_) => HomeScreen()},
      theme: AppThem.lightTheme,
    );
  }
}
