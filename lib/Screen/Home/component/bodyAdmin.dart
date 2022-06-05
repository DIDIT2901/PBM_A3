import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/Screen/Sewa/sewa.dart';

import '../../BeliBuku/beli_buku.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

onSearch(String search) {
  print("Search");
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  "Halo, Kinoy!",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 48),
                ),
              ),
              Text(
                "Mau Nyari Apa Nih Hari Ini?",
                style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                  onChanged: (value) => onSearch(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        TextEditingController().clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Cari...",
                    hintStyle:
                        TextStyle(fontSize: 14, color: Color(0xFF838383)),
                    // icon: Icon(Icons.qr_code)
                  ),
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.10), blurRadius: 20)
                ]),
              ),
              Text(
                "Nih, List Barang Di Tokomu!",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bookList.length,
                  itemBuilder: (context, int index) {
                    Books book = bookList[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.10),
                                    blurRadius: 20)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(110, 0, 20, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  book.Judul,
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Stok Sewa: " + book.StokSewa.toString(),
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                ),
                                Text(
                                  "Stok Beli: " + book.StokBeli.toString(),
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                ),
                                Text(
                                  "Terjual: " + book.Terjual.toString(),
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                ),
                                Text(
                                  "Disewa: " + book.Disewa.toString(),
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Rp. " + book.Harga.toString(),
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
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 5, 0),
                                            child: OutlinedButton(
                                              child: Text("Hapus",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              style: OutlinedButton.styleFrom(
                                                  primary: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 3),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  minimumSize: Size(20, 25)),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SewaScreen()));
                                              },
                                            ),
                                          ),
                                          OutlinedButton(
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(
                                                    252, 241, 241, 1),
                                                backgroundColor: Colors.black,
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 3),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                                minimumSize: Size(30, 25)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BeliBuku()));
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 15,
                          bottom: 15,
                          child: ClipRRect(
                            child: Image(
                              width: 90,
                              image: AssetImage(book.Image),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
