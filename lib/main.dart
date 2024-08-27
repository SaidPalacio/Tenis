import 'package:flutter/material.dart';
import 'package:prueba/Screems/config_screen.dart';


void main() {
  runApp(TennisScoreApp());
}

class TennisScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConfigScreen(),
    );
  }
}
