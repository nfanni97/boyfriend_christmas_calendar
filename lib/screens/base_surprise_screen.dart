import 'package:flutter/material.dart';

class BaseSurpriseScreen extends StatelessWidget {
  final int id;
  final int day;
  final Widget content;

  BaseSurpriseScreen({@required this.id,@required this.day,@required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: snowy arrow as leading element?
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dec. $day',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: content,
    );
  }
}