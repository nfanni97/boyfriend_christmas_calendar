import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          title: Theme.of(context).textTheme.title.copyWith(
                fontFamily: 'The Perfect Christmas',
                fontSize: 50,
                color: Colors.red.shade800,
              ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
