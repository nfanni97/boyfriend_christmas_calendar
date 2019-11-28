import 'package:flutter/material.dart';

class BaseSurpriseScreen extends StatelessWidget {
  final int day;
  final Widget content;

  BaseSurpriseScreen({@required this.day,@required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: snowy arrow as leading element?
      //TODO: add singlechildscrollview here, remove from everywhere else
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'December $day',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Stack(
        children: <Widget>[
          //TODO: put bells or something here
          Positioned(
            top: 0,
            left: 0,
            child: Icon(Icons.event),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(Icons.event),
          ),
          Center(
            child: content,
          ),
        ],
      ),
    );
  }
}