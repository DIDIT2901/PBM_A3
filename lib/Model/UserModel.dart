import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? Username;
  String? Alamat;

  UserModel({this.Username, this.Alamat});

  factory UserModel.fromMap(map) {
    return UserModel(
      Username: map['Username'],
      Alamat: map['Alamat'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Username': Username,
      'Alamat': Alamat,
    };
  }

  Map<String, dynamic> toJson() => {'Username': Username, 'Alamat': Alamat};

  UserModel.fromSnapshot(snapshot)
    : Username = snapshot.data()['Username'],
    Alamat = snapshot.data()['Alamat'];
}