import 'package:flutter/material.dart';
import 'package:magicball/screens/screens.dart';

class MyWeb extends StatelessWidget {
  const MyWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 ball 🎱',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}
