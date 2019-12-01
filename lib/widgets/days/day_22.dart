import 'package:flutter/material.dart';

import 'package:code/models/word.dart';
import 'package:code/widgets/crossword.dart';

class Day22 extends StatelessWidget {
  const Day22();
  final List<Word> words = const [
    Word(
      'csorba',
      1,
      'Legjobb székely kaja',
    ),
    Word(
      'fegyverszünet',
      8,
      'A varázsszó',
    ),
    Word(
      'szekrénylakó',
      2,
      'Rózsa',
    ),
    Word(
      'harmadiksík',
      2,
      'bilincs',
    ),
    Word('kecskebéka', 5, 'Khm...privát állatka'),
    Word(
      'csokitélapó',
      5,
      'Az első ajándék, amit tőled kaptam',
    ),
    Word(
      'puli',
      2,
      'én',
    ),
    Word(
      'ötvenegyes',
      3,
      'kedvenc szabályod',
    ),
    Word(
      'kolléga',
      0,
      'te',
    ),
  ];
  int get maxLeftLetters {
    int max = words.first.leftLetters;
    for (var i = 1; i < words.length; i++) {
      if (words[i].leftLetters > max) {
        max = words[i].leftLetters;
      }
    }
    return max;
  }

  int get maxRightLetters {
    int max = words.first.rightLetters;
    for (var i = 1; i < words.length; i++) {
      if (words[i].rightLetters > max) {
        max = words[i].rightLetters;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: List.generate(
            words.length,
            (index) => CrossWord(
                  words[index],
                  maxLeftLetters,
                  maxRightLetters,
                )),
      ),
    );
  }
}
