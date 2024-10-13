import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class sephaTap extends StatefulWidget {
  const sephaTap({super.key});

  @override
  State<sephaTap> createState() => _sephaTapState();
}

class _sephaTapState extends State<sephaTap> {
  int angle = 0;
  int tasbehCounter = 0;
  int x = 0; //variable used to make the tasbehname changing every 33 press
  List<String> tasbehatNames = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  String tasbehname = 'سبحان الله';
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String tasbehCounterString = tasbehCounter.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: settingsProvider.isDark
                      ? hight * 70 / hight
                      : hight * 35 / hight,
                ),
                Center(
                  child: Transform.rotate(
                    angle: angle * pi / 180,
                    child: Image.asset(
                      'assets/images/${settingsProvider.sebhaImageName}.png',
                      fit: BoxFit.fill,
                      height:
                          settingsProvider.isDark ? .25 * hight : .35 * hight,
                      width: settingsProvider.isDark ? .6 * width : .8 * width,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                settingsProvider.languageCode == 'en'
                    ? Row(
                        children: [
                          SizedBox(
                            width: width * .2,
                          ),
                          Image.asset(
                            'assets/images/${settingsProvider.headSebhaImageName}.png',
                            fit: BoxFit.fill,
                            height: hight * .12,
                            width: width * .2,
                          ),
                        ],
                      )
                    : Image.asset(
                        'assets/images/${settingsProvider.headSebhaImageName}.png',
                        fit: BoxFit.fill,
                        height: hight * .12,
                        width: width * .2,
                      ),
                SizedBox(
                  width: width * .1,
                )
              ],
            )),
          ],
        ),
        SizedBox(
          height: settingsProvider.isDark ? hight * .02 : 0,
        ),
        Text(
          AppLocalizations.of(context)!.tasbehCounter,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: hight * 22 / hight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: settingsProvider.isDark
                ? AppThem.darkPrimary
                : AppThem.lightPrimary.withOpacity(.4),
          ),
          width: width * 69 / width,
          height: hight * 81 / hight,
          child: Center(
              child: Text(
            tasbehCounterString,
            style: Theme.of(context).textTheme.headlineSmall,
          )),
        ),
        ElevatedButton(
          onPressed: () {
            tasbehCounter++;
            x++;
            angle += 5;
            if (x == 99) {
              x = 0;
            }
            tasbehchange();
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: hight * 5 / hight, horizontal: width * 15 / width),
            backgroundColor:
                settingsProvider.isDark ? AppThem.gold : AppThem.lightPrimary,
          ),
          child: Text(
            tasbehname,
            style: settingsProvider.isDark
                ? Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppThem.black)
                : Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppThem.white),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: hight * 40 / hight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  restart();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: settingsProvider.isDark
                        ? AppThem.gold
                        : AppThem.lightPrimary,
                    foregroundColor: AppThem.black),
                child: Text(AppLocalizations.of(context)!.restart),
              ),
            ],
          ),
        )
      ],
    );
  }

  void tasbehchange() {
    if (x < 33) {
      tasbehname = tasbehatNames[0];
    } else if (x < 66) {
      tasbehname = tasbehatNames[1];
    } else if (x < 99) {
      tasbehname = tasbehatNames[2];
    }
  }

  void restart() {
    tasbehCounter = 0;
    x = 0;
    tasbehname = 'سبحان الله';
    setState(() {});
  }
}
