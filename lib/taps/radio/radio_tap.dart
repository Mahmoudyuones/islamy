import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/models/radio_response.dart';
import 'package:islamy/taps/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  int currentIndex = 0;
  int radioListLenght = 0;
  final player = AudioPlayer();
  bool isPlaying = false;
  List<Radios> radiosToPlayUri = [];
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
        Text(
          "اذاعة القرأن الكريم",
          style: TextStyle(
              color: settingsProvider.isDark ? AppThem.white : AppThem.black,
              fontWeight: FontWeight.bold,
              fontSize: 25),
          textAlign: TextAlign.center,
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
        SizedBox(
          height: hight * .02,
        ),
        FutureBuilder(
          future: getRdio(),
          builder: (context, snapshot) {
            List<Radios>? radios = snapshot.data?.radios ?? [];
            radioListLenght = radios.length;
            radiosToPlayUri = radios;

            if (snapshot.hasData) {
              return Text(
                "القارئ : ${radios[currentIndex].name}",
                style: TextStyle(
                    color:
                        settingsProvider.isDark ? AppThem.white : AppThem.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.center,
              );
            } else if (snapshot.hasError) {
              return Text(
                "Something went wrong",
                style: TextStyle(
                    color:
                        settingsProvider.isDark ? AppThem.white : AppThem.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.center,
              );
            } else {
              return const CircularProgressIndicator(
                color: AppThem.darkPrimary,
              );
            }
          },
        ),
        SizedBox(
          height: hight * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                if (currentIndex > 0) {
                  currentIndex--;
                  if (isPlaying) {
                    player.stop();
                    isPlaying = false;
                  }
                  setState(() {});
                }
              },
              icon: Icon(
                Icons.skip_previous_sharp,
                color: settingsProvider.isDark
                    ? AppThem.gold
                    : AppThem.lightPrimary,
                size: hight * .05,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (isPlaying) {
                  await player.stop();
                  isPlaying = false;
                } else {
                  await player
                      .play(UrlSource(radiosToPlayUri[currentIndex].url ?? ''));
                  isPlaying = true;
                }
                setState(() {});
              },
              icon: isPlaying
                  ? Icon(
                      Icons.stop,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary,
                      size: hight * .08,
                    )
                  : Icon(
                      Icons.play_arrow_rounded,
                      color: settingsProvider.isDark
                          ? AppThem.gold
                          : AppThem.lightPrimary,
                      size: hight * .08,
                    ),
            ),
            IconButton(
                onPressed: () {
                  if (currentIndex < radioListLenght - 1) {
                    currentIndex++;
                    if (isPlaying) {
                      player.stop();
                      isPlaying = false;
                    }
                    setState(() {});
                  }
                },
                icon: Icon(
                  Icons.skip_next_sharp,
                  color: settingsProvider.isDark
                      ? AppThem.gold
                      : AppThem.lightPrimary,
                  size: hight * .05,
                ))
          ],
        )
      ],
    );
  }

  Future<RadioResponse> getRdio() async {
    Uri url = Uri.parse('https://mp3quran.net/api/v3/radios');
    final response = await http.get(url);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      RadioResponse radioResponse = RadioResponse.fromJson(json);
      return radioResponse;
    } else {
      throw Exception('Failed to load radio');
    }
  }
}
