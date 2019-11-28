import 'package:flutter/material.dart';

class Day12 extends StatefulWidget {
  const Day12();
  static const intro = '''Tudom, hogy mennyire utálod és kérsz mindig...
Hát most kapsz egyet minden további nélkül!''';
  static const ending = 'Mármint egy mosogatást!';

  @override
  _Day12State createState() => _Day12State();
}

class _Day12State extends State<Day12> {
  var _isWaitingOver = false;
  double get _opacity => _isWaitingOver ? 1.0 : 0.0;
  final _duration = Duration(seconds: 1);

  _Day12State() {
    Future.delayed(
      Duration(seconds: 2),
      () => setState(() => _isWaitingOver = true),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          Day12.intro,
          textAlign: TextAlign.center,
        ),
        AnimatedOpacity(
          child: Text(
            Day12.ending,
            textAlign: TextAlign.center,
          ),
          opacity: _opacity,
          duration: _duration,
        ),
        AnimatedOpacity(
          child: Image.asset(
            'assets/imgs/day_12.png',
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          opacity: _opacity,
          duration: _duration,
        ),
      ],
    );
  }
}
