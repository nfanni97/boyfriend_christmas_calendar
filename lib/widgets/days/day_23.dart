import 'package:flutter/material.dart';

class Day23 extends StatelessWidget {
  const Day23();
  static const intro =
      'A kedvenc személyemnek. Nézegesd a kedvenc szemeimmel :P (na jó ez kicsit creepy)';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            intro,
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          'assets/imgs/day_23.jpg',
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ],
    );
  }
}
