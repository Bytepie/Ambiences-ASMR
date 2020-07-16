import 'package:flutter/material.dart';
import 'package:ambience/screens/splash.dart';
import 'package:ambience/screens/ambiences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mystic Ambience',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey,
        accentColor: Color(0xFF21243d),
      ),
      routes: {'/': (context)=> Ambiences(title: 'Feels',)},
      initialRoute: '/',
    );
  }
}
