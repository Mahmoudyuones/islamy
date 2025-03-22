import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/settings/language.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: "العربية", code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (isdark) => settingsProvider
                    .changeTheme(isdark ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: AppThem.gold,
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Language",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: settingsProvider.isDark
                        ? AppThem.darkPrimary
                        : AppThem.white,
                    value: languages.firstWhere(
                      (element) =>
                          element.code == settingsProvider.languageCode,
                    ),
                    items: languages
                        .map((language) => DropdownMenuItem<Language>(
                              value: language,
                              child: Text(language.name),
                            ))
                        .toList(),
                    style: Theme.of(context).textTheme.titleLarge,
                    onChanged: (selectedLanguage) {
                      if (selectedLanguage != null) {
                        settingsProvider.changelanguage(selectedLanguage.code);
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
