import 'package:flutter/material.dart';
import 'package:selibu/Screen/BeliBuku/component/body.dart';

class BeliBuku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBeli(
        Deskripsi : 'Test',
        Halaman: 10,
        Harga: 10,
        Judul: 'Test',
        Penerbit: 'Test',
        Penulis: 'Test',
        Stok: 10,
        TahunTerbit: 10,
        Gambar: 'Test',
      ),
    );
  }
}
