import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(child: LoginPage()),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Text(
                  "Halo! Selibu Disini",
                ),
              ),
              Text("Kenalan Dulu Yuk Sama Aplikasi Selibu!")
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: Image.asset("assets/Buku.png"),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Jadi, di aplikasi Selibu ini, Kamu Bisa Menyewa dan Membeli Buku loh! Baru Tau kan?",
                ),
              ),
              Text("Temukan Buku Favoritmu Di Aplikasi Selibu")
            ],
          ),
        ),
        Container(
            child: Container(
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Text("Lanjut Login",
                        style: TextStyle(color: Colors.white, fontSize: 16)))))
      ],
    ));
  }
}
