import 'package:flutter/material.dart';
import 'package:islamy/app_them.dart';
import 'package:islamy/taps/hadeth/hadeth.dart';

class HadethContentScreen extends StatelessWidget {
  static const routeName = 'hadeth-screen';

  const HadethContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
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
                color: AppThem.white, borderRadius: BorderRadius.circular(25)),
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
