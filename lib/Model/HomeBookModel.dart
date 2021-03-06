class HomeBookModel {
  String? Deskripsi;
  int? Halaman;
  int? Harga;
  String? Judul;
  String? Penerbit;
  String? Penulis;
  int? TahunTerbit;
  String? Gambar;
  int? Stok;
  int? StokSewa;

  Map<String, dynamic> toMap() {
    return {
      'Deskripsi': this.Deskripsi,
      'Halaman': this.Halaman,
      'Harga': this.Harga,
      'Judul': this.Judul,
      'Penerbit': this.Penerbit,
      'Penulis': this.Penulis,
      'TahunTerbit': this.TahunTerbit,
      'Gambar': this.Gambar,
      'Stok': Stok,
      'StokSewa': this.StokSewa
    };
  }

  // HomeBookModel.fromSnapshot(snapshot)
  //   : Deskripsi = snapshot.data()['Deskripsi'],
  //   Halaman = snapshot.data()['Halaman'],
  //   Harga = snapshot.data()['Harga'],
  //   Judul = snapshot.data()['Judul'],
  //   Penerbit = snapshot.data()['Penerbit'],
  //   Penulis = snapshot.data()['Penulis'],
  //   TahunTerbit = snapshot.data()['TahunTerbit'],
  //   Gambar = snapshot.data()['Gambar'],
  //   StokSewa = snapshot.data()['StokSewa'];
}