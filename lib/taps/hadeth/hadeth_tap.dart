import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/hadeth/hadeth.dart';
import 'package:islamy/taps/hadeth/hadeth_content_screen.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethTap extends StatefulWidget {
  const HadethTap({super.key});

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double hight = MediaQuery.of(context).size.height;
    if (ahadeth.isEmpty) {
      loadHadeth();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hadith_header.png',
          height: MediaQuery.sizeOf(context).height * .25,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: hight * 5 / 870),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary,
                      width: 3))),
          child: Center(
            child: Text(
              'الأحاديث',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 12),
            separatorBuilder: (_, __) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(HadethContentScreen.routeName,
                    arguments: ahadeth[index]);
              },
              child: Text(
                ahadeth[index].title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            itemCount: ahadeth.length,
          ),
        ),
      ],
    );
  }

  Future<void> loadHadeth() async {
    String hadethContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethString = hadethContent.split('#');
    ahadeth = ahadethString.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title: title, content: content);
    }).toList();
    setState(() {});
  }
}
