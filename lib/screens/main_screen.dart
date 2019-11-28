import 'package:flutter/material.dart';

import 'package:code/widgets/item.dart';
import 'package:code/current_date.dart';

class MainScreen extends StatelessWidget {
  final int daysToChristmas =
      DateTime.utc(2019, 12, 24).difference(currentDate).inDays;
  final Map<int, String> suffixes = {
    1: 'et',
    2: 't',
    3: 'at',
    4: 'et',
    5: 'öt',
    6: 'ot',
    7: 'et',
    8: 'at',
    9: 'et',
    10: 'et',
    20: 'at'
  };
  final List<_Position> pos = [
    _Position(
      left: 150,
      top: 60,
    ),
    _Position(
      left: 160,
      top: 160,
    ),
    _Position(
      left: 130,
      top: 220,
    ),
    _Position(
      left: 180,
      top: 300,
    ),
    _Position(
      left: 100,
      top: 350,
    ),
    _Position(
      left: 250,
      top: 410,
    ),
    _Position(
      left: 170,
      top: 440,
    ),
    _Position(
      left: 85,
      top: 450,
    ),
    _Position(
      left: 160,
      top: 520,
    ),
    _Position(
      left: 40,
      top: 550,
    ),
    _Position(
      left: 260,
      top: 600,
    ),
    _Position(
      left: 200,
      top: 660,
    ),
    _Position(
      left: 110,
      top: 640,
    ),
    _Position(
      left: 80,
      top: 710,
    ),
    _Position(
      left: 200,
      top: 800,
    ),
    _Position(
      left: 50,
      top: 820,
    ),
    _Position(
      left: 140,
      top: 860,
    ),
    _Position(
      left: 250,
      top: 900,
    ),
    _Position(
      left: 10,
      top: 940,
    ),
    _Position(
      left: 100,
      top: 1000,
    ),
    _Position(
      left: 280,
      top: 1150,
    ),
    _Position(
      left: 190,
      top: 1050,
    ),
    _Position(
      left: 70,
      top: 1110,
    ),
    _Position(
      left: 150,
      top: 1200,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    print(pos.length);
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/imgs/christmas_tree.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
              ),
              ...List.generate(
                pos.length,
                (id) => Positioned(
                  child: Item(id + 1),
                  top: pos[id].top,
                  left: pos[id].left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    String suffix;
    // compute suffix
    if (daysToChristmas == 0) {
      suffix = '';
    } else if (suffixes.keys.contains(daysToChristmas)) {
      suffix = suffixes[daysToChristmas];
    } else {
      suffix = suffixes[daysToChristmas % 10];
    }
    final appBarData =
        _AppBarData(daysToChristmas == 0, daysToChristmas, suffix);
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: AppBar(
        flexibleSpace: Padding(
          padding: appBarData.padding,
          child: Text(
            appBarData.title,
            style: Theme.of(context).textTheme.title,
            maxLines: appBarData.maxLines,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

//TODO: rewrite parameters for Galaxy J5
class _AppBarData {
  double fullHeight;
  String title;
  int maxLines;
  EdgeInsets padding;

  _AppBarData(bool isChristmas, [int daysToChristmas, String suffix]) {
    fullHeight = 200;
    if (isChristmas) {
      title = 'Boldog karácsonyt!';
      maxLines = 1;
      padding = EdgeInsets.only(top: 50);
    } else {
      title = 'Már csak $daysToChristmas-$suffix kell\n aludni karácsonyig!';
      maxLines = 2;
      padding = EdgeInsets.only(top: 30);
    }
  }
}

class _Position {
  final double top;
  final double left;

  _Position({@required this.top, @required this.left});
}
