import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final bool isOpened;
  final int num;

  Item(this.isOpened, [this.num]);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isOpened;
  int _num;

  @override
  void initState() {
    super.initState();
    _isOpened = widget.isOpened;
    _num = widget.num;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: _isOpened ? Colors.green : Colors.red,
        child: Text(_num?.toString() ?? ''),
      ),
    );
  }

  void onTap() {
    if(!_isOpened) {
      setState(() {
        _isOpened = true;
        _num = 5;
      });
    }
  }
}
