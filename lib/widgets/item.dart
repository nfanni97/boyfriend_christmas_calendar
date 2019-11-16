import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final int id;

  Item(this.id);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.red,
      ),
    );
  }

  void onTap() {
    //TODO: rewrite so it loads from provider
    
  }
}
