import 'package:flutter/material.dart';

class Day6 extends StatelessWidget {
  const Day6();
  static const intro = '''
Wheeeee, boldog első évfordulót! <3
Confession time: tudom, hogy vásározást beszéltünk meg, viszont addigra már megvoltak a jegyek :/
Remélem azért tetszeni fog, 7-re megyünk szóval még előtte belefér a vásár is ;)
''';
//TODO: circular text? https://pub.dev/packages/flutter_circular_text#-readme-tab-
  static const hint = '''
\"És amely világot álmaikban látnak,
Tündérország még csak árnya e világnak.\"
''';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            intro,
            textAlign: TextAlign.center,
          ),
          Text(
            hint,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/imgs/day_06.png',
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ],
      ),
    );
  }
}
