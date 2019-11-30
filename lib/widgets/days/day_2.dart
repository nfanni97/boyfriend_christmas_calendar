import 'package:flutter/material.dart';

class Day2 extends StatelessWidget {
  const Day2();
  static const intro =
      '''Csak hogy nehogy elfelejtsd hogy voltunk ám Koperben ;)
P.S.: gyere átvenni az ajándékod (:''';
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
          'assets/imgs/day_02.jpg',
          height: MediaQuery.of(context).size.height * 0.65,
        ),
      ],
    );
  }
}
