import 'package:flutter/material.dart';

class Day13 extends StatelessWidget {
  const Day13();
  static const intro = '''Boldog Luca-napot!
Azt mondják, ilyenkor tilos ágyat húzni és mosni.
Nem szeretném, ha emiatt megutálnának a boszik,
úgyhogy megcsinálom helyetted én ;)''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          intro,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          'assets/imgs/day_13.png',
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ],
    );
  }
}
