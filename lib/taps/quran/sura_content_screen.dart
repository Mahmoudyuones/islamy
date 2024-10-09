import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/quran/suar_name_ayat_class.dart';
import 'package:islamy/widgets/loading_indecator.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = '/sura_content';

  SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];

  late SuarNameAyatClass arg;

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)!.settings.arguments as SuarNameAyatClass;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
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
            child: ayat.isEmpty
                ? LoadingIndecator()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(ayat[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                    itemCount: ayat.length,
                  ),
          ),
        ));
  }

  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/text/${arg.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
