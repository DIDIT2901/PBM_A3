import 'package:flutter/material.dart';

class Books {
  String Judul;
  String Deskripsi;
  String Imange;
  int Harga;

  Books(
    {
      required this.Judul,
      required this.Deskripsi,
      required this.Imange,
      required this.Harga
    }
  );
}

List<Books> bookList = [
  Books(
    Judul: "SagaraS",
    Deskripsi: "Akhirnya. Siapa orang tua Ali dijawab di buku ini. Ali, bertahun-tahun, berusaha memecahkan misteri itu. Raib dan Seli tentu tidak akan membiarkan Ali sendirian, mereka sahabat sejati. Dan...",
    Imange: "https://media.karousell.com/media/photos/products/2022/3/15/pdf_sagaras_tere_liye_1647345154_ba1bb58a_progressive.jpg",
    Harga: 71000
  )
];