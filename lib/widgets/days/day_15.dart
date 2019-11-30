import 'package:flutter/material.dart';

class Day15 extends StatelessWidget {
  const Day15();
  static const intro =
      'Azt nem mondom, hogy ilyen szépeket fogunk csinálni, de ígérem nagyon finomat kapsz :P';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          intro,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          'assets/imgs/day_15.jpg',
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ],
    );
  }
}
