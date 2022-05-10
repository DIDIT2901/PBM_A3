import 'package:flutter/material.dart';
import 'package:selibu/Screen/BuktiPembelian/component/background.dart';

class Body extends StatefulWidget {
  @override
  BuktiPembelian createState() => BuktiPembelian();
}

class BuktiPembelian extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Yeaayy",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 28),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                  child: Text(
                    "Pembelianmu Udah Berhasil Nih, Simpan Bukti Pembeliannya Ya...",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 45, 20, 5),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 20)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
