import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/home.dart';
import 'package:selibu/Screen/Login/component/background.dart';
import 'package:selibu/Screen/Login/component/input_email.dart';
import 'package:selibu/Screen/Login/component/input_password.dart';
import 'package:selibu/Screen/Login/component/text_field.dart';
import 'package:selibu/Screen/Navbar.dart';
import 'package:selibu/Screen/SignUp/signup_screen.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:selibu/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Selamat Datang Di Selibu",
            style: TextStyle(
              fontFamily: "Made-Tommy",
              fontWeight: FontWeight.w700,
              fontSize: 28
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Text(
            "Yuk, Login Ke Akunmu!",
            style: TextStyle(
              fontFamily: "Made-Tommy",
              fontWeight: FontWeight.w400,
              fontSize: 24
            ),
          ),
          InputEmail(
            hintText: "Email",
            onchanged: (value) {},
          ),
          input_password(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return NavBar();
                })
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            child: Text(
              "Belum Punya Akun?",
              style: TextStyle(
                color: Color(0xFF838383),
                fontWeight: FontWeight.bold,
                fontSize: 12,
                decoration: TextDecoration.underline
              ),
            ),
          )
        ],
      ),
    );
  }
}

