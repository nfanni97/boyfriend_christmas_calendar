import 'dart:async';

import 'package:flutter/material.dart';

class Day11 extends StatefulWidget {
  const Day11();
  static const intro =
      '''Mikor kicsik voltunk, mindig volt az adventi naptárban egy papírdarab is.
Ezekből aztán karácsonyra összeállt valami szép történet.
Te viszont naaaagyon jó voltál egész évben, úgyhogy megkapod az egészet most :)''';
  static const title = 'Fekete István: Karácsony éjjel';

  @override
  _Day11State createState() => _Day11State();
}

class _Day11State extends State<Day11> {
  static var _isStoryShowing = false;
  Timer _timer;
  _Day11State() {
    _timer = Timer(
      Duration(seconds: 10),
      () => setState(() => _isStoryShowing = true),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if(_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _isStoryShowing ? buildStory(context) : buildIntro(),
    );
  }

  Widget buildStory(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/texts/day_11.txt'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Text(
                Day11.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2.copyWith(fontSize: 26),
              ),
              Text(
                snapshot.data,
                style: Theme.of(context).textTheme.body2,
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget buildIntro() {
    return Center(
      child: Text(
        Day11.intro,
        textAlign: TextAlign.center,
      ),
    );
  }
}
