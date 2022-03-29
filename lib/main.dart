import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
//  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SvgPicture.asset(
          'assets/get_started.svg'
        ),
      ),
    );
  }
}