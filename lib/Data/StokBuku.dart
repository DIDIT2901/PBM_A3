import 'package:flutter/material.dart';

class Books {
  String Judul;
  String Image;
  int StokSewa;
  int StokBeli;
  int Terjual;
  int Disewa;
  int Harga;

  Books(
      {required this.Judul,
      required this.Image,
      required this.StokSewa,
      required this.StokBeli,
      required this.Terjual,
      required this.Disewa,
      required this.Harga});
}

List<Books> bookList = [
  Books(
      Judul: "SagaraS",
      Image: "assets/Images/SagaraS.jpg",
      StokSewa: 75,
      StokBeli: 136,
      Terjual: 14,
      Disewa: 25,
      Harga: 71000),
  Books(
      Judul: "Lupa Jadi Manusia",
      Image: "assets/Images/Lupa Jadi Manusia.jpg",
      StokSewa: 43,
      StokBeli: 86,
      Terjual: 17,
      Disewa: 14,
      Harga: 80000),
  Books(
      Judul: "Arunika",
      Image: "assets/Images/Arunika.jpg",
      StokSewa: 56,
      StokBeli: 24,
      Terjual: 54,
      Disewa: 36,
      Harga: 79000),
  Books(
      Judul: "Gara-Gara Corona",
      Image: "assets/Images/Gara-Gara Corona.jpg",
      StokSewa: 78,
      StokBeli: 94,
      Terjual: 24,
      Disewa: 12,
      Harga: 88000)
];
