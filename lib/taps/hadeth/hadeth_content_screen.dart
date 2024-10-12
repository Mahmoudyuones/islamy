import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/hadeth/hadeth.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatelessWidget {
  static const routeName = 'hadeth-screen';

  const HadethContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${Provider.of<SettingsProvider>(context).backgrounImageName}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(hadeth.title),
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
            child: ListView.builder(
              itemBuilder: (_, index) => Text(hadeth.content[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              itemCount: hadeth.content.length,
            ),
          ),
        ));
  }
}
