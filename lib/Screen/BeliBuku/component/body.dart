import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/TransaksiModel.dart';
import 'package:selibu/Screen/BeliBuku/component/background.dart';
import 'package:selibu/Screen/Navbar.dart';

class BodyBeli extends StatefulWidget {

  String Deskripsi;
  int Halaman;
  int Harga;
  String Judul;
  String Penerbit;
  String Penulis;
  int Stok;
  int TahunTerbit;
  String Gambar;

  BodyBeli({
    Key? key,
    required this.Deskripsi, 
    required this.Halaman, 
    required this.Harga, 
    required this.Judul, 
    required this.Penerbit, 
    required this.Penulis, 
    required this.Stok, 
    required this.TahunTerbit, 
    required this.Gambar, 
  }) : super(key: key);

  @override
  _BeliBuku createState() => _BeliBuku(
    Judul, Deskripsi, Penulis, Penerbit, TahunTerbit, Halaman, Stok, Gambar, Harga
  );
}

class _BeliBuku extends State<BodyBeli> {

  String? _Deskripsi;
  int? _Halaman;
  int? _Harga;
  String? _Judul;
  String? _Penerbit;
  String? _Penulis;
  int? _Stok;
  int? _TahunTerbit;
  String? _Gambar;
  DateTime? _Tanggal;

  _BeliBuku(this._Judul, this._Deskripsi, this._Penulis, this._Penerbit, this._TahunTerbit, this._Halaman, this._Stok, this._Gambar, this._Harga);

  int numOfItems = 1;

  int _Count = 1;
  void _PlusCount() {
    _Stok;
    setState(() {
      if (_Count <= _Stok!) _Count++;
    });
  }

  void _MinCount(){
    setState(() {
      if (_Count > 1) _Count--;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    int Total;
    // _Deskripsi;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Yuk, Cek Bukunya!",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 28),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                  child: const Text(
                    "Pastiin buku yang kamu pilih udah benar ya!",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 5),
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
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _Judul.toString(),
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            _Gambar.toString(),
                            height: 100,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _Deskripsi.toString(),
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Penulis: " + _Penulis.toString(),
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Penerbit: " + _Penerbit.toString(),
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Tahun Terbit: " + _TahunTerbit.toString(),
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Jumlah Halaman: " + _Halaman.toString() + " Halaman",
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Text(
                            "Stok Tersedia: " + _Stok.toString(),
                            style: const TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: const Text(
                                  "Jumlah",
                                  style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            )),
                                        child: FloatingActionButton(
                                          heroTag: 'Min',
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                          backgroundColor: Color.fromARGB(255, 33, 33, 33),
                                          elevation: 5,
                                          onPressed: () {_MinCount();},
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '$_Count',
                                        style: const TextStyle(
                                            fontFamily: "Made-Tommy",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            )),
                                        child: FloatingActionButton(
                                          heroTag: 'Plus',
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          backgroundColor: Color.fromARGB(255, 33, 33, 33),
                                          elevation: 5,
                                          onPressed: () {_PlusCount();},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                OutlinedButton(
                  child: const Text(
                    "Beli",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: const Color.fromRGBO(252, 241, 241, 1),
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black, width: 3),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      minimumSize: const Size(40, 45)),
                  onPressed: () async {
                    try {
                      var _Pembeli;
                      String? GambarBuku = _Gambar;
                      User? user = FirebaseAuth.instance.currentUser;

                      _Pembeli = user!.uid;
                      _Tanggal = DateTime.now();
                      Total = (_Harga! * _Count);
                      
                      TransaksiModel transaksiModel = TransaksiModel();

                      transaksiModel.Buku = _Judul.toString();
                      transaksiModel.Jumlah = _Count;
                      transaksiModel.Pembeli = _Pembeli.toString();
                      transaksiModel.Tanggal = _Tanggal;
                      transaksiModel.Total = Total;
                      transaksiModel.Gambar = GambarBuku;

                      await FirebaseFirestore.instance.collection('Transaksi').doc().set({
                        'Buku': _Judul,
                        'Pembeli': _Pembeli,
                        'Jumlah': _Count,
                        'Status': 'Menunggu Konfirmasi',
                        'Kategori': 'Pembelian',
                        'Tanggal': _Tanggal,
                        'Total': Total,
                        'Gambar': GambarBuku
                      });
                      
                      await showDialog(context: context, builder: (context) =>AlertDialog(
                        title: const Text(
                          "Pembelian Sukses!",
                          style: TextStyle(
                            fontFamily: "Made-Tommy",
                            fontWeight: FontWeight.w700,
                            fontSize: 28
                          ),
                        ),
                        content: const Text(
                          "Pembelianmu sudah disimpan!",
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

                    } catch(e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  child: const Text(
                    "Kembali",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black, width: 3),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      minimumSize: const Size(40, 45)),
                  onPressed: () {
                    Navigator.pop(context);
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

