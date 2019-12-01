import 'package:flutter/material.dart';

class Day24 extends StatefulWidget {
  const Day24();
  static const intro =
      'Éés karácsony. Remélem legalább akkora örömödet lelted a nyitogatásban, mint én az előkészítésben! Boldog karácsonyt!';
  static const ending = 'És el ne felejtsd kibontani az ajándékod :P';

  @override
  _Day24State createState() => _Day24State();
}

class _Day24State extends State<Day24> {
  var _visible = false;
  double get _opacity => _visible ? 1.0 : 0.0;
  var _duration = Duration(seconds: 1);

  _Day24State() {
    Future.delayed(
      Duration(seconds: 4),
      () => setState(() => _visible = true),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          Day24.intro,
          textAlign: TextAlign.center,
        ),
        AnimatedOpacity(
          child: Text(
            Day24.ending,
            textAlign: TextAlign.center,
          ),
          opacity: _opacity,
          duration: _duration,
        ),
      ],
    );
  }
}
