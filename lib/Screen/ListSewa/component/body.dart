import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Data/ListSewa.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

onSearch(String search) {
  print("Search");
}

var _homeUsername;
Future getUsername() async{
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user != null) {
        await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
          _homeUsername = (value.data()!['Username']);
        });
      }
    }

final Stream<QuerySnapshot> _HomeSewa = FirebaseFirestore.instance.collection('Sewa').snapshots();

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
                      ),
                    ),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10), blurRadius: 20)
                    ]),
                  ),
                  const Text(
                    "Ini Nih List Buku Yang Kamu Sewa,",
                    style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _HomeSewa,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text('Ada yang salah nih');
                        if (snapshot.connectionState == ConnectionState.waiting){
                          return const SizedBox(
                            child: CircularProgressIndicator(),
                            height: 10,
                            width: 10,
                          );
                        } else{
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, int index) {
                              DateTime TanggalTr = (snapshot.data!.docs[index]['Tanggal']).toDate();
                              String FormattedTanggal = DateFormat('dd MMM yyyy  kk:mm').format(TanggalTr);

                              return Stack(
                                children: <Widget>[
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
                                            "Katergori : " + snapshot.data!.docs[index]['Kategori'],
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Tanggal : " + FormattedTanggal.toString(),
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Sisa Hari : " + snapshot.data!.docs[index]['SisaHari'].toString() + " Hari",
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
                                          Text(
                                            "Denda : " + "Rp." + snapshot.data!.docs[index]['Denda'].toString(),
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 10),
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
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
