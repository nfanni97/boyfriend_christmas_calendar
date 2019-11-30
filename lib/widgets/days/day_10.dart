import 'package:flutter/material.dart';

class Day10 extends StatelessWidget {
  const Day10();
  static const text = '''Már annyi medvét kaptam tőled, és még egyet se adtam.
De ez már nem sokáig marad így...
Gyere átvenni a mai apróságot!''';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30),
        ),
      ),
    );
  }
}
