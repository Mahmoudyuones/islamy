import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/quran/suar_name_ayat_class.dart';

class SuraContentScreen extends StatelessWidget {
  static const String routeName = '/sura_content';
  List<String> ayat = [
    '"بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ "',
    '',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    ' الرَّحْمَنِ الرَّحِيمِ',
    ' مَالِكِ يَوْمِ الدِّينِ',
    ' إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    ' اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    ' صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين',
  ];
  late SuarNameAyatClass arg;

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)!.settings.arguments as SuarNameAyatClass;
    loadSuraFile();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(arg.suraName),
          ),
          body: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: MediaQuery.sizeOf(context).height * .05),
            decoration: BoxDecoration(
                color: AppThem.white, borderRadius: BorderRadius.circular(25)),
            child: ListView.builder(
              itemBuilder: (_, index) => Text(ayat[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              itemCount: ayat.length,
            ),
          ),
        ));
  }

  void loadSuraFile() {
    print('dsf');
  }
}
