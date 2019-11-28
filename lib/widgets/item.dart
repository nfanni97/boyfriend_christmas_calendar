import 'package:code/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:code/bloc/bloc.dart';
import 'package:code/models/already_opened_exception.dart';
import 'package:code/screens/base_surprise_screen.dart';
import 'package:code/widgets/days/all_days.dart';

class Item extends StatefulWidget {
  final int id;
  static const days = {
    'day_1': Day1(),
    'day_2': Day2(),
    'day_3': Day3(),
    'day_4': Day4(),
    'day_5': Day5(),
    'day_6': Day6(),
    'day_7': Day7(),
    'day_8': Day8(),
    'day_9': Day9(),
    'day_10': Day10(),
    'day_11': Day11(),
    'day_12': Day12(),
    'day_13': Day13(),
    'day_14': Day14(),
    'day_15': Day15(),
    'day_16': Day16(),
    'day_17': Day17(),
    'day_18': Day18(),
    'day_19': Day19(),
    'day_20': Day20(),
    'day_21': Day21(),
    'day_22': Day22(),
    'day_23': Day23(),
    'day_24': Day24(),
  };

  Item(this.id);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isInit = true;
  Bloc _bloc;
  ItemModel _data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isInit = false;
      _bloc = Provider.of<Bloc>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ItemModel>(
      stream: _bloc.itemParams,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          _data = _bloc.allItems[widget.id - 1];
        } else if (snapshot.hasData && snapshot.data.itemId == widget.id) {
          _data = snapshot.data;
        } else if (snapshot.hasError &&
            snapshot.error is AlreadyOpenedException &&
            (snapshot.error as AlreadyOpenedException).itemId == widget.id) {
          //TODO: how to handle error?
          print('already opened today');
        }
        String ornamentColor;
        if (_data.isOpened == null || !_data.isOpened) {
          ornamentColor = 'base';
        } else if (_data.openedOn % 2 == 0) {
          ornamentColor = 'gold';
        } else {
          ornamentColor = 'red';
        }
        return InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(top: 17),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/imgs/ornament_' + ornamentColor + '.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Text(
              '${_data.surpriseId ?? '-'}',
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
            width: 40,
            height: 50,
          ),
        );
      },
    );
  }

  /* void showError(String msg) {
    showDialog<void>(
      context: context,
      builder: (BuildContext c) => AlertDialog(
        title: Text('Hoppá, hiba a mátrixban'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Hát jó...'),
            onPressed: () => Navigator.of(c).pop(),
          )
        ],
      ),
    );
  } */

  Future<void> onTap() async {
    if (!_data.isOpened) {
      await _bloc.openItem(widget.id);
    }
    if (_data.isOpened) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BaseSurpriseScreen(
            day: _data.openedOn,
            content: Item.days['day_${_data.openedOn}'],
          ),
        ),
      );
    }
  }
}
