import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class radioTap extends StatelessWidget {
  const radioTap({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: hight * .15,
        ),
        Center(
          child: Image.asset(
            'assets/images/radio_image.png.png',
            fit: BoxFit.fill,
            height: hight * 240 / 870,
            width: width * 390 / 412,
          ),
        ),
        SizedBox(
          height: hight * .05,
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(
              color: settingsProvider.isDark ? AppThem.white : AppThem.black,
              fontWeight: FontWeight.bold,
              fontSize: 25),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: hight * .05,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_previous_sharp,
                color: settingsProvider.isDark
                    ? AppThem.gold
                    : AppThem.lightPrimary,
                size: hight * .05,
              ),
              Icon(
                Icons.play_arrow_rounded,
                color: settingsProvider.isDark
                    ? AppThem.gold
                    : AppThem.lightPrimary,
                size: hight * .08,
              ),
              Icon(
                Icons.skip_next_sharp,
                color: settingsProvider.isDark
                    ? AppThem.gold
                    : AppThem.lightPrimary,
                size: hight * .05,
              )
            ],
          ),
        )
      ],
    );
  }
}
