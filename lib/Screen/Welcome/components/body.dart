import 'package:flutter/material.dart';
import 'package:selibu/Screen/Welcome/components/background.dart';
import 'package:selibu/constants.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:selibu/Screen/Login/Login.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Selibu Disini!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(height: size.height * 0.03),
          Text(
            "Kenalan dulu yuk, sama aplikasi selibu",
            style: TextStyle(fontSize: 23),
          ),
          SizedBox(height: size.height * 0.03),
          Image.asset(
            "assets/images/Buku.png",
            height: size.height * 0.25,
          ),
          SizedBox(height: size.height * 0.03),
          Text(
            "Jadi, di aplikasi Selibu ini, kamu bisa menyewa dan membeli buku loh! Baru tau kan?",
            style: TextStyle(fontSize: 16),
          ),
          RoundedButton(
            text: "Lanjut Login",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
