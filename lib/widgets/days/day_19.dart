import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Day19 extends StatefulWidget {
  const Day19();
  static const intro =
      'Vissza az alapokhoz! Már nagyon menő vagy robotokban meg polinomokban, de mennyire megy az alap CCS? :P';

  @override
  _Day19State createState() => _Day19State();
}

class _Day19State extends State<Day19> {
  var _selectedValue = -1;

  void _onSelect(int value) {
    setState(() {
      _selectedValue = value;
      if (_selectedValue == 0) {
        // show dialog with clapping robot
        showDialog(
          context: context,
          builder: (c) => AlertDialog(
            title: Text('Yaay, megcsináltad!'),
            content: Image.asset(
              'assets/videos/day_19.gif',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Egész biztos, hogy jól számoltál? Nézd meg újra!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
      child: Column(
        children: <Widget>[
          Text(
            Day19.intro,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/imgs/day_19.png',
            height: MediaQuery.of(context).size.width * 0.9,
          ),
          buildTest(),
        ],
      ),
    );
  }

  Widget buildTest() {
    return Column(
      children: <Widget>[
        Text('BIBO-stabil a rendszer?'),
        buildChoice(0, 'igen'),
        buildChoice(1, 'nem')
      ],
    );
  }

  Widget buildChoice(int value, String text) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: _selectedValue,
          onChanged: _onSelect,
        ),
        Text(text),
      ],
    );
  }
}
