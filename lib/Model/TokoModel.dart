import 'dart:ffi';

class HomeBookModel {
  String? Alamat;
  String? CP;
  String? Cabang;
  String? Jalan;
  Int? JamBuka;
  Int? JamTutup;
  Int? MenitBuka;
  Int? MenitTutup;

  Map<String, dynamic> toMap() {
    return {
      'Alamat': this.Alamat,
      'CP': this.CP,
      'Cabang': this.Cabang,
      'Jalan': this.Jalan,
      'JamBuka': this.JamBuka,
      'JamTutup': this.JamTutup,
      'MenitBuka': this.MenitBuka,
      'MenitTutup': this.MenitTutup
    };
  }
}