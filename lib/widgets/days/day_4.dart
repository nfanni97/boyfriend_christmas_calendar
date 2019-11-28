import 'package:flutter/material.dart';

class Day4 extends StatelessWidget {
  const Day4();
  static const text = '''Ma kapod az egyik legnagyobb meglepetést: egy joker kívánságot.
Haználd fel bölcsen és lelkiismeretesen! ;)''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          'assets/imgs/day_04.png',
          height: MediaQuery.of(context).size.height * 0.7,
        ),
      ],
    );
  }
}
