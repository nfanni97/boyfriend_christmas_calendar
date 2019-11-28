import 'package:flutter/material.dart';

class Day3 extends StatelessWidget {
  const Day3();
  static const intro = '''Movie night!
Annyit meséltél róla, biztos jó :)''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          intro,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          'assets/imgs/day_03.jpg',
          height: MediaQuery.of(context).size.height * 0.7,
        ),
      ],
    );
  }
}
