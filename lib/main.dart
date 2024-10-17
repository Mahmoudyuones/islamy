import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/home_screen.dart';
import 'package:islamy/taps/hadeth/hadeth_content_screen.dart';
import 'package:islamy/taps/quran/sura_content_screen.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsProvider settingsProvider = SettingsProvider();
  await settingsProvider.loadSettings();

  runApp(
    ChangeNotifierProvider<SettingsProvider>(
      create: (_) => settingsProvider,
      child: Islamy(),
    ),
  );
}

class Islamy extends StatelessWidget {
  const Islamy({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContentScreen.routeName: (_) => SuraContentScreen(),
        HadethContentScreen.routeName: (_) => HadethContentScreen(),
      },
      theme: AppThem.lightTheme,
      darkTheme: AppThem.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
