import 'package:flutter/material.dart';

class Books {
  String Judul;
  String Kategori;
  String Image;
  String Status;
  String Kurir;
  String Tanggal;
  int Jumlah;
  int Harga;

  Books(
      {required this.Judul,
      required this.Kategori,
      required this.Image,
      required this.Jumlah,
      required this.Status,
      required this.Kurir,
      required this.Tanggal,
      required this.Harga});
}

List<Books> bookList = [
  Books(
      Judul: "SagaraS",
      Kategori: "Pembelian",
      Image: "assets/Images/SagaraS.jpg",
      Harga: 71000,
      Jumlah: 1,
      Tanggal: "5 Mei 2022",
      Status: "Dalam Pengiriman",
      Kurir: "Winarto"),
];
