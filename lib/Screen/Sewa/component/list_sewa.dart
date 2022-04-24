class Stores {
  String nama;
  String tempat;
  String jarak;
  String waktu;
  String telepon;
  String image;

  Stores({
    required this.nama,
    required this.tempat,
    required this.jarak,
    required this.waktu,
    required this.image,
    required this.telepon,
  });
}

List<Stores> storeList = [
  Stores(
      nama: "Cabang Sumbersari",
      tempat: "Kec. Sumbersari Kota Jember",
      jarak: "7 Km",
      waktu: "08.00 - 16.00",
      telepon: "0815 4876 4219",
      image: "assets/Images/Cabang Sumbersari.jpeg"),
  Stores(
      nama: "Cabang Kaliwates",
      tempat: "Kec. Kaliwates Kab. Jember",
      jarak: "12 Km",
      waktu: "13.00 - 21.00",
      telepon: "0854 3468 1549",
      image: "assets/Images/Cabang Kaliwates.jpeg"),
  Stores(
      nama: "Cabang Patrang",
      tempat: "Kec. Patrang Kota Jember",
      jarak: "15 Km",
      waktu: "08.00 - 18.00",
      telepon: "0813 7529 1546",
      image: "assets/Images/Cabang Patrang.jpeg"),
];
