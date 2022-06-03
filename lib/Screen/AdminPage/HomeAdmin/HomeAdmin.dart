import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/Screen/BeliBuku/beli_buku.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Screen/Sewa/sewa.dart';

import '../../Home/component/body.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {

  final TextEditingController _searchController = TextEditingController();
  String? _homeUsername;

  
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 00, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  "Halo, Admin",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 48),
                ),
              ),
              const Text(
                "Mau Nyari Apa Nih Hari Ini?",
                style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => onSearch(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Cari...",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFF838383)),
                    // icon: Icon(Icons.qr_code)
                  ),
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.10), blurRadius: 20)
                ]),
              ),
              const Text(
                "Yang Lagi Trend Nih!",
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
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                            padding: const EdgeInsets.fromLTRB(110, 10, 20, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  book.Judul,
                                  style: const TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  book.Deskripsi,
                                  style: const TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Rp. " + book.Harga.toString(),
                                        style: const TextStyle(
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
                                                const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                            child: OutlinedButton(
                                              child: const Text("Sewa",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              style: OutlinedButton.styleFrom(
                                                  primary: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  side: const BorderSide(
                                                      color: Colors.black,
                                                      width: 3),
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  minimumSize: const Size(20, 25)),
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
                                            child: const Text(
                                              "Beli",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                                primary: const Color.fromRGBO(
                                                    252, 241, 241, 1),
                                                backgroundColor: Colors.black,
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 3),
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                                minimumSize: const Size(30, 25)),
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