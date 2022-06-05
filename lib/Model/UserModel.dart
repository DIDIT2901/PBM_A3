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
}