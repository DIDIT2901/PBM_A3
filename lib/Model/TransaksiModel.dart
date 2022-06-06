import 'package:cloud_firestore/cloud_firestore.dart';

class TransaksiModel {
  String? Pembeli;
  String? Kategori;
  String? Buku;
  int? Jumlah;
  String? Status;
  DateTime? Tanggal;
  int? Total;
  String? Gambar;

  Map<String, dynamic> toMap() {
    return {
      'Pembeli': this.Pembeli,
      'Kategori': Kategori,
      'Buku': this.Buku,
      'Jumlah': this.Jumlah,
      'Status': this.Status,
      'Tanggal': this.Tanggal,
      'Total': Total,
      'Gambar': Gambar
    };
  }
}