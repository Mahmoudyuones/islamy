import 'package:flutter/material.dart';

class sephaTap extends StatelessWidget {
  const sephaTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(child: Image.asset('assets/images/head of seb7a.png')),
        Image.asset('assets/images/body of seb7a.png')
      ],
    );
  }
}
