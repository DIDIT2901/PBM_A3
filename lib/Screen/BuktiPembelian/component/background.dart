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
            top: -60,
            left: 0,
            // bottom: ,
            child: Image.asset(
              "assets/Images/Vector_5.png",
              width: size.width * 1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
