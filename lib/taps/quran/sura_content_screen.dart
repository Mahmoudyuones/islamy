import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/quran/suar_name_ayat_class.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:islamy/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = '/sura_content';

  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];

  late SuarNameAyatClass arg;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    arg = ModalRoute.of(context)!.settings.arguments as SuarNameAyatClass;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${Provider.of<SettingsProvider>(context).backgrounImageName}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(arg.suraName),
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: MediaQuery.sizeOf(context).height * .05),
            decoration: BoxDecoration(
                color: settingsProvider.isDark
                    ? AppThem.darkPrimary
                    : AppThem.white,
                borderRadius: BorderRadius.circular(25)),
            child: ayat.isEmpty
                ? const LoadingIndecator()
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
