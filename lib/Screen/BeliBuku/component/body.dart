import 'package:flutter/material.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/Screen/BeliBuku/component/background.dart';
import 'package:selibu/Screen/Home/home.dart';
import 'package:selibu/Screen/Navbar.dart';
import 'package:selibu/components/rounded_button.dart';

class Body extends StatefulWidget {
  @override
  _BeliBuku createState() => _BeliBuku();
}

class _BeliBuku extends State<Body> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: SingleChildScrollView(
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
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 20)
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "SagaraS",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Image.asset(
                            "assets/Images/SagaraS.jpg",
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Akhirnya. Siapa orang tua Ali dijawab di buku ini. Ali, bertahun-tahun, berusaha memecahkan misteri itu. Raib dan Seli tentu tidak akan membiarkan Ali sendirian, mereka sahabat sejati. Dan...",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Penulis: Tere Liye",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Penerbit: PT. Sabak Grip Nusantara",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Tahun Terbit: 2022",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Jumlah Halaman: 384 Halaman",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Stok Tersedia: 136",
                            style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Jumlah",
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black54,
                                          )),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                          fontFamily: "Made-Tommy",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black54,
                                          )),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                OutlinedButton(
                  child: Text(
                    "Bayar",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: Color.fromRGBO(252, 241, 241, 1),
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      minimumSize: Size(40, 45)),
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  child: Text(
                    "Kembali",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.black, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      minimumSize: Size(40, 45)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavBar()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
