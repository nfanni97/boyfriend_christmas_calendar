import 'package:flutter/material.dart';

class Day7 extends StatelessWidget {
  const Day7();
  static const intro = '''Remélem, ma is be van állva a nyakad
(vagyis nem, de érted),
meeeert a mai meglepetés egy
SZÖRNYEN JÓ hátmasszázs ;)''';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 35.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            intro,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/imgs/day_07.png',
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ],
      ),
    );
  }
}
