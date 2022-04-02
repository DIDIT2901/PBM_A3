import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/Vector_1.png",
              width: size.width * 1,
            ),
          ),
          Positioned(
            top: 75,
            left: 110,
            child: Image.asset(
              "assets/images/Vector_2.png",
              width: size.width * 1,
            ),
          ),
          Image.asset(
            "assets/images/Buku.png",
            height: size.height * 0.25,
          ),
        ],
      ),
    );
  }
}
