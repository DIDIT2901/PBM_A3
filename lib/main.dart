import 'package:flutter/material.dart';
import 'package:selibu/Screen/Welcome/welcome_screen.dart';
import 'package:selibu/Screen/Welcome/welcome_screen.dart';
import 'package:selibu/constants.dart';
// import 'package:selibu/Screen/BeliBuku/beli_buku.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selibuu',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
