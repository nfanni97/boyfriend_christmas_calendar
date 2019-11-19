import 'package:code/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:code/bloc/bloc.dart';
import 'package:code/models/already_opened_exception.dart';

class Item extends StatefulWidget {
  final int id;

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
        } else if (snapshot.hasError && snapshot.error is AlreadyOpenedException && (snapshot.error as AlreadyOpenedException).itemId == widget.id) {
          //TODO: how to handle error?
          print('already opened today');
        }
        return InkWell(
          onTap: onTap,
          child: Container(
            child: Text('${_data.surpriseId ?? '-'}'),
            color: _data.isOpened ? Colors.green : Colors.red,
            width: 30,
            height: 30,
          ),
        );
      },
    );
  }

  Future<void> onTap() async {
    if (!_data.isOpened) {
      await _bloc.openItem(widget.id);
    }
    //TODO: open appropriate content
  }
}
