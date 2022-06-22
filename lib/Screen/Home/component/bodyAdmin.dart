import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/UserModel.dart';
import 'package:selibu/Screen/BeliBuku/component/body.dart';
import 'package:selibu/Screen/EditBuku/EditBuku.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/Screen/Sewa/sewa.dart';

import '../../BeliBuku/beli_buku.dart';
import '../../EditBuku/component/body.dart';

class BodyAdmin extends StatefulWidget {
  const BodyAdmin({Key? key}) : super(key: key);

  @override
  State<BodyAdmin> createState() => _BodyAdminState();
}

onSearch(String search) {
  print("Search");
}

class _BodyAdminState extends State<BodyAdmin> {
  List listBuku = List.empty();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserModel? userDetails;

  final Stream<QuerySnapshot> _HomeBook = FirebaseFirestore.instance.collection('Buku').snapshots(); 

  final TextEditingController _searchController = TextEditingController();
  var _homeUsername;
  List<Object> _homeBookList = [];

  @override
  
  Future getUsername() async{
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user != null) {
        await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
          _homeUsername = (value.data()!['Username']);
        });
      }
    }
  
  DeleteBook(indexNomor) async{
    await FirebaseStorage.instance.ref('BookImage/${indexNomor + 1}.jpg').delete();
    await FirebaseFirestore.instance.collection('Buku').doc('${indexNomor + 1}').delete();
    setState(() {});
  }
  
  List ListBeliBuku = [];

  Widget build(BuildContext context) {
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
                      "Halo, $_homeUsername!",
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
                "Nih List Barang Di Tokomu!",
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
                    if (snapshot.hasError) return const Text('Ada yang salah nih');
                    if (snapshot.connectionState == ConnectionState.waiting){
                      return const SizedBox(
                        child: CircularProgressIndicator(),
                        height: 10,
                        width: 10,
                      );
                    } else {
                      return Form(
                        key: _formKey,
                        child: ListView.builder(
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
                                          "Stok Beli : " + snapshot.data!.docs[index]['Stok'].toString(),
                                          style: const TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11),
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Stok Sewa : " + snapshot.data!.docs[index]['StokSewa'].toString(),
                                          style: const TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11),
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Halaman : " + snapshot.data!.docs[index]['Halaman'].toString(),
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
                                                      child: const Text("Hapus",
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
                                                      onPressed: () async{
                                                        await showDialog(
                                                          context: context, 
                                                          builder: (context) => AlertDialog(
                                                            title: const Text(
                                                              "Hapus Buku?",
                                                                style: TextStyle(
                                                                  fontFamily: "Made-Tommy",
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 36
                                                                ),
                                                            ),
                                                            content: const Text(
                                                              "Apakah Anda Yakin Untuk Hapus Data Buku Ini? Seluruh Data Buku Ini Akan Terhapus",
                                                                style: TextStyle(
                                                                  fontFamily: "Made-Tommy",
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 16
                                                                ),
                                                            ),
                                                            actions: [
                                                              TextButton(onPressed: (() {
                                                                Navigator.of(context).pop();
                                                              }), child: const Text('Batal'),),
                                                              TextButton(onPressed: (() {
                                                                DeleteBook(index);
                                                                setState(() {});
                                                                Navigator.of(context).pop();
                                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                  content: Text('Buku Berhasil Dihapus', style: TextStyle(color: Colors.white),),
                                                                  backgroundColor: Colors.black,
                                                                ));
                                                                }), child: const Text('Hapus'),)
                                                            ],
                                                          )
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  OutlinedButton(
                                                    child: const Text(
                                                      "Edit",
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
                                                                  BodyBuku(Deskripsi: snapshot.data!.docs[index]['Deskripsi'], Halaman: snapshot.data!.docs[index]['Halaman'], Harga: snapshot.data!.docs[index]['Harga'], Judul: snapshot.data!.docs[index]['Judul'], Penerbit: snapshot.data!.docs[index]['Penerbit'], Penulis: snapshot.data!.docs[index]['Penulis'], Stok: snapshot.data!.docs[index]['Stok'], StokSewa: snapshot.data!.docs[index]['StokSewa'], TahunTerbit: snapshot.data!.docs[index]['TahunTerbit'], Gambar: snapshot.data!.docs[index]['Gambar'], indexDoc: index+1,)
                                                                  ));
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
                        ),
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
