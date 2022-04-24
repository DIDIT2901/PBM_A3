import 'package:flutter/material.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/Screen/BeliBuku/component/background.dart';

class Body extends StatelessWidget {
  final Books book;
  Body(this.book);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Yuk, Cek Bukunya!",
              style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w700,
                  fontSize: 28),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
              child: Text(
                "Pastiin buku yang kamu pilih udah benar ya!",
                style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 5),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.10), blurRadius: 20)
                  ],
                ),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          book.Judul,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
