import 'package:flutter/material.dart';

class Day14 extends StatelessWidget {
  const Day14();
  static const intro = '''(A mai meglepi átvihető másik napra is.)
Menjünk korizni!
Azt nem mondom, hogy ilyeneket fogunk csinálni, de azért biztos jó lesz :D''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            intro,
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          'assets/imgs/day_14.jpg',
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ],
    );
  }
}
