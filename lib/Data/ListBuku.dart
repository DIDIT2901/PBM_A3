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

List<Books> booksList = [
  Books(
      Judul: "SagaraS",
      Kategori: "Pembelian",
      Image: "assets/Images/SagaraS.jpg",
      Harga: 71000,
      Jumlah: 1,
      Tanggal: "5 Mei 2022",
      Status: "Dalam Pengiriman",
      Kurir: "Winarto"),
  Books(
      Judul: "Lupa Jadi Manusia",
      Kategori: "Pembelian",
      Image: "assets/Images/Lupa Jadi Manusia.jpg",
      Harga: 80000,
      Jumlah: 2,
      Tanggal: "6 Mei 2022",
      Status: "Pembelian Selesai",
      Kurir: "Winarto")
];
