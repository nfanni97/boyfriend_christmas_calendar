import 'package:flutter/material.dart';

class DishwasherDay extends StatefulWidget {
  final String intro;
  final String ending;

  DishwasherDay(this.intro, this.ending);

  @override
  _DishwasherDayState createState() => _DishwasherDayState();
}

class _DishwasherDayState extends State<DishwasherDay> {
  var _isWaitingOver = false;
  double get _opacity => _isWaitingOver ? 1.0 : 0.0;
  final _duration = Duration(seconds: 1);

  _DishwasherDayState() {
    Future.delayed(
      Duration(seconds: 2),
      () => setState(() => _isWaitingOver = true),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.intro,
          textAlign: TextAlign.center,
        ),
        AnimatedOpacity(
          child: Text(
            widget.ending,
            textAlign: TextAlign.center,
          ),
          opacity: _opacity,
          duration: _duration,
        ),
        AnimatedOpacity(
          child: Image.asset(
            'assets/imgs/day_12.png',
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          opacity: _opacity,
          duration: _duration,
        ),
      ],
    );
  }
}
