import 'package:flutter/material.dart';

class Day9 extends StatefulWidget {
  const Day9();
  static const intro = '''Ma Rózsát Kapsz.
Gyere átvenni az ajándékod ;)''';
  static const gotcha = 'Kac-kac :D';

  @override
  _Day9State createState() => _Day9State();
}

class _Day9State extends State<Day9> {
  var _isGotchaVisible = false;
  var _isRoseVisible = false;

  _Day9State() {
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => _isGotchaVisible = true),
    );
    Future.delayed(
      Duration(seconds: 2),
      () => setState(() => _isRoseVisible = true),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            Day9.intro,
            textAlign: TextAlign.center,
          ),
          AnimatedOpacity(
            child: Text(Day9.gotcha),
            opacity: _isGotchaVisible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
          ),
          AnimatedOpacity(
            child: Image.asset(
              'assets/imgs/day_09.png',
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            opacity: _isRoseVisible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
          ),
        ],
      ),
    );
  }
}
