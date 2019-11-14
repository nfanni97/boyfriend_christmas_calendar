import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final int daysToChristmas =
      DateTime.utc(2019, 12, 24).difference(DateTime.utc(2019, 12, 3)).inDays;
  Map<int, String> suffixes = const {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            buildAppBar(context),
          ];
        },
        body: Center(
          child: Text('Boldog karácsonyt'),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    String suffix;
    // compute suffix
    if (suffixes.keys.contains(daysToChristmas)) {
      suffix = suffixes[daysToChristmas];
    } else {
      suffix = suffixes[daysToChristmas % 10];
    }
    return SliverAppBar(
      //TODO: rewrite parameters for Galaxy J5
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: 0),
        title: Text(
          daysToChristmas == 0
              ? 'Boldog karácsonyt!'
              : 'Már csak $daysToChristmas-$suffix kell\n aludni karácsonyig!',
          style: Theme.of(context).textTheme.title,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        background:
            Placeholder(), //TODO: image with remaining days in big red letters
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: Text(''),
      ),
    );
  }
}
