import 'package:flutter/material.dart';

class Books {
  String Judul;
  String Deskripsi;
  String Image;
  String Penulis;
  String Penerbit;
  int TahunTerbit;
  int Halaman;
  int Harga;

  Books(
      {required this.Judul,
      required this.Deskripsi,
      required this.Image,
      required this.Penulis,
      required this.Penerbit,
      required this.TahunTerbit,
      required this.Halaman,
      required this.Harga});
}

List<Books> bookList = [
  Books(
      Judul: "SagaraS",
      Deskripsi:
          "Akhirnya. Siapa orang tua Ali dijawab di buku ini. Ali, bertahun-tahun, berusaha memecahkan misteri itu. Raib dan Seli tentu tidak akan membiarkan Ali sendirian, mereka sahabat sejati. Dan...",
      Image: "assets/Images/SagaraS.jpg",
      Harga: 71000,
      Penulis: "Tere Liye",
      Penerbit: "PT. Sabak Grip Nusantara",
      TahunTerbit: 2022,
      Halaman: 384),
  Books(
      Judul: "Lupa Jadi Manusia",
      Deskripsi:
          "Sebuah ungkapan bagi dirimu yang tidak pernah merasa menghargai diri sendiri dengan semestinya. Dikejar oleh ambisi namun melupakan apa itu impian sejati. Sebuah...",
      Image: "assets/Images/Lupa Jadi Manusia.jpg",
      Harga: 80000,
      Penulis: "Syahid Muhammad",
      Penerbit: "Media Antologi Aditya",
      TahunTerbit: 2022,
      Halaman: 500),
  Books(
      Judul: "Arunika",
      Deskripsi:
          "Seingat Arunika Prameswari, malam sebelum tidur, dia masih gadis biasa saja. Gadis yang hidup di desa bersama keluarganya, yang sederhana namun bahagia. Lalu...",
      Image: "assets/Images/Arunika.jpg",
      Harga: 79000,
      Penulis: "Pipit Chie",
      Penerbit: "Pipit's Publishing",
      TahunTerbit: 2022,
      Halaman: 917),
  Books(
      Judul: "Gara-Gara Corona",
      Deskripsi:
          "Siapa yang menyangka virus yang muncul akhir 2019 lalu bisa sampai ke Indonesia? Dan mengubah hidup semua orang di muka bumi ini. Termasuk...",
      Image: "assets/Images/Gara-Gara Corona.jpg",
      Harga: 88000,
      Penulis: "Alnira",
      Penerbit: "Alnira",
      TahunTerbit: 2022,
      Halaman: 331)
];
