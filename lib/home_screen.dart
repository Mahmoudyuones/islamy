import 'package:flutter/material.dart';
import 'package:islamy/taps/hadeth/hadeth_tap.dart';
import 'package:islamy/taps/quran/quran_tap.dart';
import 'package:islamy/taps/radio/radio_tap.dart';
import 'package:islamy/taps/sepha/sepha_tap.dart';
import 'package:islamy/taps/settings/settings_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    sephaTap(),
    radioTap(),
    settingsTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: taps[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/moshaf_gold.png')),
                  label: 'quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: 'hadeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: 'sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'settings')
            ]),
      ),
    );
  }
}
