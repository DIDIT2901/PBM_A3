import 'package:flutter/material.dart';

class Books {
  String Judul;
  String Kategori;
  String Image;
  String Tanggal;
  String Status;
  int SisaHari;
  int Denda;

  Books(
      {required this.Judul,
      required this.Kategori,
      required this.Image,
      required this.Denda,
      required this.SisaHari,
      required this.Status,
      required this.Tanggal});
}

List<Books> booksList = [
  Books(
      Judul: "SagaraS",
      Kategori: "Pembelian",
      Image: "assets/Images/SagaraS.jpg",
      Denda: 0,
      Tanggal: "5 Mei 2022",
      Status: "Telah Mengembalikan",
      SisaHari: 0),
  Books(
      Judul: "Lupa Jadi Manusia",
      Kategori: "Pembelian",
      Image: "assets/Images/Lupa Jadi Manusia.jpg",
      Denda: 0,
      Tanggal: "6 Mei 2022",
      Status: "Telah Mengembalikan",
      SisaHari: 0)
];
