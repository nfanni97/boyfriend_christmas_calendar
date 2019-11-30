import 'package:flutter/material.dart';

import 'package:code/widgets/dishwasher_day.dart';

class Day16 extends StatelessWidget {
  const Day16();
  static const intro =
      'Tudom, tudom, 12-én már kaptál egyet (ha bontottál 12-én), de most...';
  static const ending = '...elmosom a serpenyőt is ;)';
  @override
  Widget build(BuildContext context) {
    return DishwasherDay(intro, ending);
  }
}
