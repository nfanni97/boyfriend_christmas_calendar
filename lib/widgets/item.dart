import 'package:code/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:code/bloc/bloc.dart';
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
    //TODO: UI, handle AlreadyOpenedException
    return StreamBuilder<ItemModel>(
      stream: _bloc.itemParams,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          _data = _bloc.allItems[widget.id-1];
        }
        else if (snapshot.hasData && snapshot.data.itemId == widget.id) {
          _data = snapshot.data;
        } else {
          return Container(
            color: Colors.purple,
            width: 30,
            height: 30,
          );
        }
        return Container(
          child: Text('${_data.itemId}'),
          width: 30,
          height: 30,
        );
      },
    );
  }

  Future<void> onTap() async {
    await _bloc.openItem(widget.id);
    //TODO: open surprise screen
  }
}
