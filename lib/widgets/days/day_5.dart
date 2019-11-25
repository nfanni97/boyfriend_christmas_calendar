import 'package:flutter/material.dart';

class Day5 extends StatelessWidget {
  const Day5();
  static const text = '''
Hali! Ma egy kis nasit kapsz: gyere át érte ;)
P.S.: holnap estére ne csinálj programot ;)
''';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30),
      ),
    );
  }
}
