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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            buildAppBar(context),
          ];
        },
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: List.generate(
        24,
        (id) => Positioned(
          top: id * 20.0,
          left: id * 10.0,
          child: Item(id + 1),
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
        AppBarData(daysToChristmas == 0, daysToChristmas, suffix);
    return SliverAppBar(
      expandedHeight: appBarData.fullHeight,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: 0),
        title: Text(
          appBarData.title,
          style: Theme.of(context).textTheme.title,
          maxLines: appBarData.maxLines,
          textAlign: TextAlign.center,
        ),
        background:
            Placeholder(), //TODO: image with remaining days in big red letters
      ),
      bottom: appBarData.bottom,
    );
  }
}

//TODO: rewrite parameters for Galaxy J5
class AppBarData {
  double fullHeight;
  String title;
  int maxLines;
  PreferredSize bottom;

  AppBarData(bool isChristmas, [int daysToChristmas, String suffix]) {
    fullHeight = 200;
    if (isChristmas) {
      title = 'Boldog karácsonyt!';
      maxLines = 1;
      bottom = null;
    } else {
      title = 'Már csak $daysToChristmas-$suffix kell\n aludni karácsonyig!';
      maxLines = 2;
      bottom = PreferredSize(
        preferredSize: Size.fromHeight(25.0),
        child: Text(''),
      );
    }
  }
}
