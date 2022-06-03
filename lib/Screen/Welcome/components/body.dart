import 'package:flutter/material.dart';
import 'package:selibu/Screen/Login/component/body.dart';
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
          const Text(
            "Selibu Disini!",
            style: TextStyle(
                fontFamily: "Made-Tommy",
                fontWeight: FontWeight.w700,
                fontSize: 32),
          ),
          SizedBox(height: size.height * 0.03),
          const Text(
            "Kenalan dulu yuk, sama aplikasi selibu",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Made-Tommy",
                fontWeight: FontWeight.w400,
                fontSize: 23),
          ),
          SizedBox(height: size.height * 0.03),
          Image.asset(
            "assets/Images/Buku.png",
            height: size.height * 0.25,
          ),
          SizedBox(height: size.height * 0.03),
          const Text(
            "Jadi, di aplikasi Selibu ini, kamu bisa menyewa dan membeli buku loh! Yuk cari tau sekarang mengenai aplikasi Selibu",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Made-Tommy",
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          RoundedButton(
            text: "Lanjut Login",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginConfirm();
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
