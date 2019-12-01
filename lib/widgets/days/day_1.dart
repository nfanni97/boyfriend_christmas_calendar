import 'package:flutter/material.dart';

class Day1 extends StatelessWidget {
  const Day1();
  static const first = '''Először is, mivel költő nem vagyok
Kérlek nézd el nekem, hogy rímeim...rosszak.

Szóval, ahogy egyre közeledett a december,
Gondolkozott mind jobban az egy szem agysejtem:
Mit adhatnék Balázsnak most, hogy lassan egy éve,
Azaz 12 hónapja tesszük egymásnak a szépet.

Végül jött az isteni szikra:
Kinek ne lenne szüksége egy századik appra?
Úgyhogy rögtön munkához is láttam
És kódoltam, kódoltam, kódoltam Dart-ban.

Ennek az eredménye ez az adventi kalendáriOm
Hol az első díszben ezt a versecskét kínálom.
Most hogy már látod tehetségem az íráshoz,
Azt hiszem abba is hagyom a kínzásod :P
Jó színezgetést!''';
  
  @override
  Widget build(BuildContext context) {
    return Text(
      first,
      textAlign: TextAlign.center,
    );
  }
}