import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Screen/AdminPage/NavbarAdmin/NavbarAdmin.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Model/HomeBookModel.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final user = FirebaseAuth.instance.currentUser;

  TextEditingController _Judul = TextEditingController();
  TextEditingController _Deskripsi = TextEditingController();
  TextEditingController _Halaman = TextEditingController();
  TextEditingController _Harga = TextEditingController();
  TextEditingController _Penerbit = TextEditingController();
  TextEditingController _Penulis = TextEditingController();
  TextEditingController _TahunTerbit = TextEditingController();
  TextEditingController _Stok = TextEditingController();
  TextEditingController _StokSewa = TextEditingController();
  late String Judul_, Deskripsi_, Penerbit_, Penulis_; 
  late int Halaman_, Harga_, TahunTerbit_, Stok_, StokSewa_;
  var _oldUsername, _oldAlamat;
  late String _oldEmail, verifEmail, verifPass;

  File? _image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this._image = imageTemp);
  }

  addBuku() async{
    
  }

  void initState() {
    super.initState();
    addBuku();
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
                              child: (_image != null)
                              ? Image.file(_image!,
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
                              // ),
                              )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Judul,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Judul tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Judul_ = value!,
                      decoration: const InputDecoration(
                          hintText: "Judul Buku", labelText: "Judul"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Deskripsi,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Deskripsi tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Deskripsi_ = value!,
                      decoration: const InputDecoration(
                          hintText: "Text", labelText: "Deskripsi"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Halaman,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Halaman tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Halaman_ = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "0", labelText: "Halaman"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Harga,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Harga tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Harga_ = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Rp.", labelText: "Harga"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Penerbit,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Penerbit tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Penerbit_ = value!,
                      decoration: const InputDecoration(
                          hintText: "Nama Penerbit", labelText: "Penerbit"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Penulis,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Penulis tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Penulis_ = value!,
                      decoration: const InputDecoration(
                          hintText: "Nama Penulis", labelText: "Penulis"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _TahunTerbit,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Tahun Terbit tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => TahunTerbit_ = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "2022", labelText: "Tahun Terbit"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _Stok,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Stok tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => Stok_ = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "0", labelText: "Stok Beli"),
                    ),
                ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _StokSewa,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Stok tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => StokSewa_ = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "0", labelText: "Stok Sewa"),
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
                          var nomorBuku;
                          final indexBuku = await FirebaseFirestore.instance.collection('Buku').get().then((value) {
                            nomorBuku = value.docs.length;
                          });
                          int indexDoc = nomorBuku! + 1;
                          HomeBookModel modelBuku = HomeBookModel();

                          modelBuku.Judul = Judul_;
                          modelBuku.Deskripsi = Deskripsi_;
                          modelBuku.Halaman = Halaman_;
                          modelBuku.Harga = Harga_ as int?;
                          modelBuku.Penerbit = Penerbit_;
                          modelBuku.Penulis = Penulis_;
                          modelBuku.TahunTerbit = TahunTerbit_ as int?;
                          modelBuku.Stok = Stok_ as int?;
                          modelBuku.StokSewa = StokSewa_ as int?;
                          
                          FirebaseFirestore.instance.collection('Buku').doc(indexDoc.toString()).set({
                            'Judul': Judul_,
                            'Deskripsi': Deskripsi_,
                            'Halaman': Halaman_,
                            'Harga': Harga_,
                            'Penerbit': Penerbit_,
                            'Penulis': Penulis_,
                            'TahunTerbit': TahunTerbit_,
                            'Stok': Stok_,
                            'StokSewa': StokSewa_
                          });
                          final path = 'BookImage/$indexDoc.jpg';
                          final upimage = FirebaseStorage.instance.ref().child(path).putFile(_image!);
                          final process = await upimage;
                          final urlImage = await process.ref.getDownloadURL();
                          modelBuku.Gambar = urlImage.toString();
                          await FirebaseFirestore.instance.collection('Buku').doc(indexDoc.toString()).update({'Gambar': urlImage});
                          await showDialog(context: context, builder: (context) => AlertDialog(
                            title: const Text(
                              "Sukses Menambah",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w700,
                                fontSize: 28
                              ),
                            ),
                            content: const Text(
                              "Data buku baru sukses ditambahkan!",
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
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            const Text(
              "Pilih Gambar Buku",
              style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.image),
                  onPressed: () => pickImage(ImageSource.gallery),
                  style: TextButton.styleFrom(primary: Colors.black),
                  label: const Text("Galeri"),
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
