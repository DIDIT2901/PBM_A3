import 'package:cloud_firestore/cloud_firestore.dart';

class SewaModel {
  String? Peminjam;
  String? Kategori;
  String? Judul;
  int? SisaHari;
  String? Status;
  DateTime? Tanggal;
  int? Denda;
  String? Gambar;

  Map<String, dynamic> toMap() {
    return {
      'Pembeli': this.Peminjam,
      'Kategori': this.Kategori,
      'Judul': this.Judul,
      'SisaHari': this.SisaHari,
      'Status': this.Status,
      'Tanggal': this.Tanggal,
      'Denda': this.Denda,
      'Gambar': this.Gambar
    };
  }
}