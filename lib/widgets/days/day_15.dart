import 'package:flutter/material.dart';

class Day15 extends StatelessWidget {
  const Day15();
  static const intro =
      '''Ugyan már rég elmúlt Mikulás, viszont közeledik a karácsony. Néhol pedig a karácsonyi ajándékokat a Télapó hozza, úgyhogy most azt kapsz egyet, hogy legyen az angyalnak egy kis segítsége :)
P.S.: este gyere átvenni a meglepit ;)''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            intro,
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          'assets/imgs/day_15.jpg',
          height: MediaQuery.of(context).size.height * 0.45,
        ),
      ],
    );
  }
}
