import 'package:flutter/material.dart';
import 'package:selibu/Screen/Welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Halo! Selibu Disini!",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
