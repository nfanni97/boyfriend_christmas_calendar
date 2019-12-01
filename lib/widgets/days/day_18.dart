import 'package:flutter/material.dart';

class Day18 extends StatelessWidget {
  const Day18();
  static const intro =
      '''Ugyan már rég elmúlt Mikulás, viszont közeledik a karácsony. Néhol pedig a karácsonyi ajándékokat a Télapó hozza, úgyhogy most azt kapsz egyet, hogy legyen az angyalnak egy kis segítsége :)
P.S.: este gyere átvenni a meglepit ;)''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 35.0,
          ),
          child: Text(
            intro,
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          'assets/imgs/day_18.jpg',
          height: MediaQuery.of(context).size.height * 0.43,
        ),
      ],
    );
  }
}
