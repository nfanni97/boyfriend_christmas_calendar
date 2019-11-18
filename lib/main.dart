import 'package:flutter/material.dart';

import 'package:code/bloc/bloc.dart';
import 'package:code/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Bloc bloc = Bloc();

  @override
  void dispose() {
    super.dispose();
    bloc.disposeOfBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          title: Theme.of(context).textTheme.title.copyWith(
                fontFamily: 'The Perfect Christmas',
                fontSize: 40,
                color: Colors.red.shade800,
              ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
