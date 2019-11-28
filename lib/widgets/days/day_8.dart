import 'package:flutter/material.dart';

import 'package:code/widgets/custom_video_player.dart';

class Day8 extends StatelessWidget {
  const Day8();
  static const intro =
      'Mindenképp szerettem volna egy karácsonyi videót is mutatni, és úgy ítéltem meg, hogy ez a legjobb (: Enjoy!';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            Day8.intro,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          CustomVideoPlayer('assets/videos/day_08.mp4'),
        ],
      ),
    );
  }
}
