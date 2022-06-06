import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:intl/intl.dart';

import '../../AdminPage/NavbarAdmin/NavbarAdmin.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

onSearch(String search) {
  print("Search");
}

final Stream<QuerySnapshot> _HomeBook = FirebaseFirestore.instance.collection('Transaksi').snapshots(); 
final Stream<QuerySnapshot> _CekHarga = FirebaseFirestore.instance.collection('Buku').snapshots(); 


var _homeUsername;
late DateTime TanggalTr;
Future getUsername() async{
  final user = FirebaseAuth.instance.currentUser?.uid;
  if (user != null) {
    await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
      _homeUsername = (value.data()!['Gambar']);
    });
  }
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getUsername(),
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 00, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      "Halo, $_homeUsername!",
                      style: const TextStyle(
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
                            TextEditingController().clear();
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
                    "Ini Nih List Buku Yang Kamu Beli,",
                    style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _HomeBook,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text('Ada yang salah nih');
                        if (snapshot.connectionState == ConnectionState.waiting){
                          return const SizedBox(
                            child: CircularProgressIndicator(),
                            height: 10,
                            width: 10,
                          );
                        } else {
                          return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, index) {
                            TanggalTr = (snapshot.data!.docs[index]['Tanggal']).toDate();
                            String FormattedTanggal = DateFormat('dd MMM yyyy  kk:mm').format(TanggalTr);
                            String _JudulHarga = snapshot.data!.docs[index]['Buku'];

                            return Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  height: 180,
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
                                    padding: const EdgeInsets.fromLTRB(110, 20, 20, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data!.docs[index]['Buku'],
                                          style: const TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Katergori : " + snapshot.data!.docs[index]['Kategori'],
                                          style: const TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          "Tanggal : $FormattedTanggal",
                                          style: const TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          "Jumlah : " + snapshot.data!.docs[index]['Jumlah'].toString(),
                                          style: const TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          "Status : " + snapshot.data!.docs[index]['Status'],
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
                                                "Rp. " + snapshot.data!.docs[index]['Total'].toString(),
                                                style: const TextStyle(
                                                    fontFamily: "Made-Tommy",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              child: OutlinedButton(
                                                child: const Text(
                                                  "Selesai",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                    primary: const Color.fromRGBO(252, 241, 241, 1),
                                                    backgroundColor: Colors.black,
                                                    side: const BorderSide(color: Colors.black, width: 3),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(Radius.circular(30))),
                                                    minimumSize: const Size(30, 25)),
                                                onPressed: () async {
                                                  try{
                                                    String _UbahSatus = 'Transaksi Selesai';
                                                    await FirebaseFirestore.instance.collection('Transaksi').doc().update({
                                                      'Status': _UbahSatus
                                                    });
                                                    await showDialog(context: context, builder: (context) =>AlertDialog(
                                                      title: const Text(
                                                        "Transaksi Selesai",
                                                        style: TextStyle(
                                                          fontFamily: "Made-Tommy",
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 28
                                                        ),
                                                      ),
                                                      content: const Text(
                                                        "Terima Kasih Telah Membeli Produk Kami >//<",
                                                        style: TextStyle(
                                                          fontFamily: "Made-Tommy",
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 16
                                                        ),
                                                      ),
                                                      actions: [TextButton(onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },child: Text('OK'),)],
                                                    ));
                                                    Navigator.of(context).pop();

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) {
                                                        return const NavBar();
                                                      })
                                                    );
                                                  }catch(e){
                                                    print(e);
                                                  }
                                                },
                                              )
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 15,
                                  bottom: 15,
                                  child: ClipRRect(
                                    child: Image.network(
                                      snapshot.data!.docs[index]['Gambar'],
                                      width: 90,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                        }
                      }
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
