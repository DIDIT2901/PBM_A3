import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/HomeBookModel.dart';
import 'package:selibu/Screen/AdminPage/NavbarAdmin/NavbarAdmin.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

class BodyBuku extends StatefulWidget {
  // BodyBuku({Key? key}) : super(key: key);

  String Deskripsi;
  int Halaman;
  int Harga;
  String Judul;
  String Penerbit;
  String Penulis;
  int Stok;
  int StokSewa;
  int TahunTerbit;
  String Gambar;
  int indexDoc;

  BodyBuku({
    Key? key,
    required this.Deskripsi, 
    required this.Halaman, 
    required this.Harga, 
    required this.Judul, 
    required this.Penerbit, 
    required this.Penulis, 
    required this.Stok, 
    required this.StokSewa, 
    required this.TahunTerbit, 
    required this.Gambar,
    required this.indexDoc,
  }) : super(key: key);

  @override
  State<BodyBuku> createState() => _BodyState(
    Judul, Deskripsi, Penulis, Penerbit, TahunTerbit, Halaman, Stok, StokSewa, Gambar, Harga, indexDoc
  );
}

class _BodyState extends State<BodyBuku> {

  String? _Deskripsi;
  int? _Halaman;
  int? _Harga;
  String? _Judul;
  String? _Penerbit;
  String? _Penulis;
  int? _Stok;
  int? _StokSewa;
  int? _TahunTerbit;
  String? _Gambar;
  int? _IndexDoc;

  _BodyState(this._Judul, this._Deskripsi, this._Penulis, this._Penerbit, this._TahunTerbit, this._Halaman, this._Stok, this._StokSewa, this._Gambar, this._Harga, this._IndexDoc);

  File? _image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this._image = imageTemp);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/Images/Vector_7.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 30,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Text(
                    "Tambah Buku Baru",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w700,
                        fontSize: 36),
                  ),
                  const Text(
                    "Pastiin Produknya Benar Ya",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 160,
                              width: 100,
                              child: (_Gambar != null)
                              ? Image.network(_Gambar.toString(),
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,)
                              : Image.asset("assets/Images/blankPhoto.jpg"),
                            )
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((Builder) => bottomSheet()));
                                },
                                child: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                              )
                              )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Judul tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Judul = value!,
                      decoration: InputDecoration(
                          hintText: _Judul, labelText: "Judul"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Deskripsi tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Deskripsi = value!,
                      decoration: InputDecoration(
                          hintText: _Deskripsi, labelText: "Deskripsi"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Halaman tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Halaman = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: _Halaman.toString(), labelText: "Halaman"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Harga tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Harga = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: _Harga.toString(), labelText: "Harga"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Penerbit tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Penerbit = value!,
                      decoration: InputDecoration(
                          hintText: _Penerbit, labelText: "Penerbit"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Penulis tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Penulis = value!,
                      decoration: InputDecoration(
                          hintText: _Penulis, labelText: "Penulis"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Tahun Terbit tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _TahunTerbit = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: _TahunTerbit.toString(), labelText: "Tahun Terbit"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Stok tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _Stok = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: _Stok.toString(), labelText: "Stok Beli"),
                    ),
                ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Stok tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => _StokSewa = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: _StokSewa.toString(), labelText: "Stok Sewa"),
                    ),
                  ),
                  SizedBox(height: 60),
                  OutlinedButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: const Color.fromRGBO(252, 241, 241, 1),
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black, width: 3),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      minimumSize: const Size(40, 45)),
                    onPressed: () async{
                      final FormState = _formKey.currentState;
                      if (FormState!.validate()){
                        FormState.save();
                        try{
                          const CircularProgressIndicator();
                          HomeBookModel modelBuku = HomeBookModel();
                          print(_IndexDoc);

                          modelBuku.Judul = _Judul;
                          modelBuku.Deskripsi = _Deskripsi;
                          modelBuku.Halaman = _Halaman;
                          modelBuku.Harga = _Harga as int?;
                          modelBuku.Penerbit = _Penerbit;
                          modelBuku.Penulis = _Penulis;
                          modelBuku.TahunTerbit = _TahunTerbit as int?;
                          modelBuku.Stok = _Stok as int?;
                          modelBuku.StokSewa = _StokSewa as int?;
                          
                          FirebaseFirestore.instance.collection('Buku').doc(_IndexDoc.toString()).update({
                            'Judul': _Judul,
                            'Deskripsi': _Deskripsi,
                            'Halaman': _Halaman,
                            'Harga': _Harga,
                            'Penerbit': _Penerbit,
                            'Penulis': _Penulis,
                            'TahunTerbit': _TahunTerbit,
                            'Stok': _Stok,
                            'StokSewa': _StokSewa
                          });
                          final path = 'BookImage/$_IndexDoc.jpg';
                          final upimage = FirebaseStorage.instance.ref().child(path).putFile(_image!);
                          final process = await upimage;
                          final urlImage = await process.ref.getDownloadURL();
                          modelBuku.Gambar = urlImage.toString();
                          await FirebaseFirestore.instance.collection('Buku').doc(_IndexDoc.toString()).update({'Gambar': urlImage});
                          await showDialog(context: context, builder: (context) => AlertDialog(
                            title: const Text(
                              "Sukses Mengubah",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w700,
                                fontSize: 28
                              ),
                            ),
                            content: const Text(
                              "Data buku telah sukses diubah!",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              ),
                            ),
                            actions: [TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: const Text('OK'))],
                          ));
                          Navigator.of(context).pop();
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const NavBarAdmin();
                          })
                        );
                        } catch(e){
                          print(e);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            Text(
              "Pilih Gambar Buku",
              style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () => pickImage(ImageSource.gallery),
                  style: TextButton.styleFrom(primary: Colors.black),
                  label: Text("Galeri"),
                )
              ],
            )
          ],
        ));
  }
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }
}
