import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:code/bloc/bloc.dart';
import 'package:code/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Bloc _bloc = Bloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.disposeOfBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _bloc,
      child: MaterialApp(
        title: 'Xmas Calendar',
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            title: Theme.of(context).textTheme.title.copyWith(
                  fontFamily: 'The Perfect Christmas',
                  fontSize: 40,
                  color: Colors.red.shade800,
                ),
            body1: Theme.of(context).textTheme.body1.copyWith(
              fontFamily: 'Cursive Standard',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
