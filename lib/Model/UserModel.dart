import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? Username;
  String? Alamat;
  String? Role;

  UserModel({this.Username, this.Alamat, this.Role});

  factory UserModel.fromMap(map) {
    return UserModel(
      Username: map['Username'],
      Alamat: map['Alamat'],
      Role: map['Role'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Username': Username,
      'Alamat': Alamat,
      'Role': Role,
    };
  }

  Map<String, dynamic> toJson() => {'Username': Username, 'Alamat': Alamat, 'Role': Role};

  UserModel.fromSnapshot(snapshot)
    : Username = snapshot.data()['Username'],
    Alamat = snapshot.data()['Alamat'],
    Role = snapshot.data()['Role'];
}