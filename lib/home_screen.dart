import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.brown,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('radio.png')), label: 'radio'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('sebha.png')), label: 'radio'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('hadeth.png')), label: 'radio'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('moshaf_gold.png')), label: 'radio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'settings')
          ]),
    );
  }
}
