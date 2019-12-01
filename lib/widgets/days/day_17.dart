import 'package:flutter/material.dart';

class Day17 extends StatelessWidget {
  const Day17();
  static const intro =
      '''Ding-ding, megütötted a főnyereményt! Unlimited csikizés, egyetlen estére :)
(a lelkiismeretedre bízom, azért maradjak életben a végére :D )''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          intro,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          'assets/imgs/day_17.png',
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ],
    );
  }
}
