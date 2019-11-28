import 'package:flutter/material.dart';

class BaseSurpriseScreen extends StatelessWidget {
  final int day;
  final Widget content;
  final bellPadding = 10.0;
  final bellSize = 25.0;

  BaseSurpriseScreen({@required this.day, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: snowy arrow as leading element?
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'December $day',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: bellPadding,
            left: bellPadding,
            child: buildBell(isleft: true, istop: true),
          ),
          Positioned(
            top: bellPadding,
            right: bellPadding,
            child: buildBell(isleft: false, istop: true),
          ),
          Positioned(
            bottom: bellPadding,
            right: bellPadding,
            child: buildBell(isleft: false, istop: false),
          ),
          Positioned(
            bottom: bellPadding,
            left: bellPadding,
            child: buildBell(isleft: true, istop: false),
          ),
          Center(
            child: SingleChildScrollView(child: content),
          ),
        ],
      ),
    );
  }

  Widget buildBell({@required bool isleft, @required bool istop}) {
    int turns;
    if (isleft) {
      if (istop) {
        turns = 3;
      } else {
        turns = 2;
      }
    } else {
      if (istop) {
        turns = 0;
      } else {
        turns = 1;
      }
    }
    return RotatedBox(
      quarterTurns: turns,
      child: Image.asset(
        'assets/imgs/bell.png',
        height: bellSize,
        width: bellSize,
      ),
    );
  }
}
