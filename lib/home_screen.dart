import 'package:flutter/material.dart';
import 'package:islamy/main.dart';
import 'package:islamy/taps/hadeth/hadeth_tap.dart';
import 'package:islamy/taps/quran/quran_tap.dart';
import 'package:islamy/taps/radio/radio_tap.dart';
import 'package:islamy/taps/sepha/sepha_tap.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:islamy/taps/settings/settings_tap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${Provider.of<SettingsProvider>(context).backgrounImageName}.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islamy),
        ),
        body: taps[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/moshaf_gold.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: AppLocalizations.of(context)!.islamy),
            ]),
      ),
    );
  }
}
