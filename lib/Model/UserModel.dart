import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? Username;
  String? Alamat;
  String? Role;
  String? PP;

  UserModel({this.Username, this.Alamat, this.Role, this.PP});

  factory UserModel.fromMap(map) {
    return UserModel(
      Username: map['Username'],
      Alamat: map['Alamat'],
      Role: map['Role'],
      PP: map['PP']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Username': Username,
      'Alamat': Alamat,
      'Role': Role,
      'PP': PP
    };
  }

  Map<String, dynamic> toJson() => {'Username': Username, 'Alamat': Alamat, 'Role': Role, 'PP': PP};

  UserModel.fromSnapshot(snapshot)
    : Username = snapshot.data()['Username'],
    Alamat = snapshot.data()['Alamat'],
    Role = snapshot.data()['Role'],
    PP = snapshot.data()['PP'];
}