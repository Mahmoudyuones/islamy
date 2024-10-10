import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';

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
              children: [
                SizedBox(
                  height: hight * 36 / hight,
                ),
                Center(
                  child: Transform.rotate(
                    angle: angle * pi / 180,
                    child: Image.asset(
                      'assets/images/body of seb7a.png',
                      fit: BoxFit.fill,
                      height: hight * .35,
                      width: width * .8,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * .1,
                ),
                Image.asset(
                  'assets/images/head of seb7a.png',
                  fit: BoxFit.fill,
                  height: hight * .12,
                  width: width * .2,
                ),
              ],
            )),
          ],
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: hight * 22 / hight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppThem.lightPrimary,
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
              backgroundColor: AppThem.lightPrimary,
              foregroundColor: AppThem.white),
          child: Text(
            tasbehname,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppThem.white),
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
                    backgroundColor: AppThem.lightPrimary,
                    foregroundColor: AppThem.black),
                child: const Text('Restart'),
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
