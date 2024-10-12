import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/quran/suar_name_ayat_class.dart';
import 'package:islamy/taps/quran/sura_content_screen.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class QuranTap extends StatelessWidget {
  List<String> suranames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  List<String> numberOfayat = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '13',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '11',
    '8',
    '8',
    '19',
    '5',
    '8',
    '8',
    '11',
    '3',
    '11',
    '8',
    '3',
    '5',
    '7',
    '3',
    '5',
    '4',
    '6',
    '5',
    '6'
  ];

  QuranTap({super.key});
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double hight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
          height: MediaQuery.sizeOf(context).height * .25,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: hight * (47 / 870),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 3.0,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Top border
                  right: BorderSide(
                      width: 1.5,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Right border
                  bottom: BorderSide(
                      width: 3.0,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Bottom border
                  left: BorderSide(
                      width: 3.0,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Left border
                ),
              ),
              child: Center(
                  child: Text(
                'عدد الآيات',
                style: Theme.of(context).textTheme.headlineLarge,
              )),
            )),
            Expanded(
                child: Container(
              height: hight * (47 / 870),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 3.0,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Top border
                  right: BorderSide(
                      width: 3,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Right border
                  bottom: BorderSide(
                      width: 3.0,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Bottom border
                  left: BorderSide(
                      width: 1.5,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary), // Left border
                ),
              ),
              child: Center(
                  child: Text(
                'إسم السورة',
                style: Theme.of(context).textTheme.headlineLarge,
              )),
            ))
          ],
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 0),
            separatorBuilder: (_, __) => const SizedBox(
              height: 0,
            ),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SuraContentScreen.routeName,
                    arguments: SuarNameAyatClass(
                      index: index,
                      suraName: suranames[index],
                    ));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      numberOfayat[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 3,
                    color: settingsProvider.isDark
                        ? AppThem.gold
                        : AppThem.lightPrimary,
                  ),
                  Expanded(
                    child: Text(
                      suranames[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            itemCount: suranames.length,
          ),
        ),
      ],
    );
  }
}
