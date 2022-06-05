import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/HomeBookModel.dart';
import 'package:selibu/Model/UserModel.dart';
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

  List listBuku = List.empty();

  UserModel? userDetails;

  final TextEditingController _searchController = TextEditingController();
  var _homeUsername;
  List<Object> _homeBookList = [];

  @override
  Widget build(BuildContext context) {

    Future getUsername() async{
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user != null) {
        await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
          _homeUsername = (value.data()!['Username']);
        });
      }
    }

    final Stream<QuerySnapshot> _HomeBook = FirebaseFirestore.instance.collection('Buku').snapshots(); 

    // getBookList();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 00, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: getUsername(),
                builder: (context, snapshot) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      "Halo, $_homeUsername",
                      style: const TextStyle(
                          fontFamily: "Made-Tommy",
                          fontWeight: FontWeight.w700,
                          fontSize: 48),
                    ),
                  );
                },
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
                child: StreamBuilder<QuerySnapshot> (
                  stream: _HomeBook,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text('Ada yang salah nih');
                    if (snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, index) {
                          return Stack(
                            children: [
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
                                        snapshot.data!.docs[index]['Judul'],
                                        style: const TextStyle(
                                            fontFamily: "Made-Tommy",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        snapshot.data!.docs[index]['Deskripsi'],
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
                                              "Rp. " + snapshot.data!.docs[index]['Harga'].toString(),
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
                                          ),
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
                                child: Image.network(
                                  snapshot.data!.docs[index]['Gambar'],
                                  fit: BoxFit.cover,
                                  width: 90,
                                ),
                              ),
                            ]
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
