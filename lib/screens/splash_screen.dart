import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:code/bloc/bloc.dart';
import 'package:code/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initDatabase(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> initDatabase(BuildContext context) async {
    await Provider.of<Bloc>(context).initDatabase();
    await Provider.of<Bloc>(context).getAllItems();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
  }
}
