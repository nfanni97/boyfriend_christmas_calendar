import 'package:flutter/material.dart';

import 'package:code/widgets/dishwasher_day.dart';

class Day12 extends StatelessWidget {
  const Day12();
  static const intro = '''Tudom, hogy mennyire utálod és kérsz mindig...
Hát most kapsz egyet minden további nélkül!''';
  static const ending = 'Mármint egy mosogatást!';
  @override
  Widget build(BuildContext context) {
    return DishwasherDay(intro, ending);
  }
}
