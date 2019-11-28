import 'package:flutter/material.dart';

import 'package:code/widgets/custom_video_player.dart';

class Day21 extends StatelessWidget {
  const Day21();
  static const intro =
      'Egyre közeledik a karácsony! Már biztos a füleden is a cukiság-tenger ömlik, úgyhogy most egy vicces videót mutatok.';
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
        CustomVideoPlayer('assets/videos/day_21.mp4'),
      ],
    );
  }
}
