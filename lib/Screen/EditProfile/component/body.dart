import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Screen/Login/component/body.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

bool seePass = true;

class _BodyState extends State<Body> {

  final user = FirebaseAuth.instance.currentUser;

  TextEditingController _newUsername = TextEditingController();
  TextEditingController _newEmail = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _newAlamat = TextEditingController();
  late String _username, _email, _password, _alamat; 
  var _oldUsername, _oldAlamat, loadimage;
  late String _oldEmail, verifEmail, verifPass;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _image;

  Future getUsername() async{
      final user = FirebaseAuth.instance.currentUser?.uid;
      final userEmail = FirebaseAuth.instance.currentUser?.email;
      _oldEmail = userEmail.toString();
      if (user != null) {
        await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
          _oldUsername = (value.data()!['Username']);
          _oldAlamat = (value.data()!['Alamat']);
        });
      }
    }
  
  Future uploadImage() async{
    final user = FirebaseAuth.instance.currentUser?.uid;
    final path = 'UserImage/$user.jpg';
    final upimage = FirebaseStorage.instance.ref().child(path);
    final process = await upimage.putFile(_image!);
    final urlImage = await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    await FirebaseFirestore.instance.collection('Users').doc(user).update({'PP': urlImage});
  }

  Future loadImage() async{
    final user = FirebaseAuth.instance.currentUser?.uid;
    // final path = 'UserImage/$user.jpg';
    // final pathNull;
    // final loadimage = await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    try {
      await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
      setState(() {
        this.loadimage = value.data()!['PP'];
      });
    });
    } catch(e){
      print(e);
    }
  }

  Future updateData() async{
    final user = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('Users').doc(user).update({'Username': _newUsername.text, 'Alamat': _newAlamat.text});
  }

  Future DeleteUser() async{
    final User = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseStorage.instance.ref('UserImage/$User.jpg').delete();
    await FirebaseFirestore.instance.collection('Users').doc(user!.uid).delete();
    await FirebaseAuth.instance.currentUser?.delete();
    await FirebaseAuth.instance.signOut();
  }

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this._image = imageTemp);
  }

  @override
  void dispose() {
    _newPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getUsername();
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/Vector_7.png"),
            fit: BoxFit.cover,
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 30,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  "Mau Edit Profile?",
                  style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w700,
                    fontSize: 36
                  ),
                ),
          
                const Text(
                  "Bikin Profile Yang Keren Ya!",
                  style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w400,
                    fontSize: 24
                  ),
                ),
          
                FutureBuilder(
                  future: loadImage(),
                  builder: (context, Scaffold) {
                    return Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 70.0,
                            child: ClipOval(
                              child: (loadimage != null)
                              ? Image.network(loadimage, width: 250, height: 250 ,fit: BoxFit.cover,)
                              : Image.asset("assets/Images/user.png"),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((Builder) => bottomSheet())
                                );
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
                  );
                  },
                ),
          
                FutureBuilder(
                  future: getUsername(),
                  builder: (context, snapshot) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        controller: _newUsername,
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Password tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                        onSaved: (value) => _username = value!,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person, color: Colors.black, size: 24,),
                          hintText: _oldUsername,
                          labelText: "Username"
                        ),
                      ),
                    );
                  },
                ),
          
                FutureBuilder(
                  future: getUsername(),
                  builder: (context, snapshot) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        controller: _newEmail,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email tidak bisa kosong";
                          }
                          if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Masukkan email yang valid");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => _email = value!,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail, color: Colors.black, size: 24,),
                          hintText: _oldEmail,
                          labelText: "Email"
                        ),
                      ),
                    );
                  },
                ),
          
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    controller: _newPassword,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password tidak bisa kosong";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Password min. 6 karakter");
                        } else {
                          return null;
                        }
                    },
                    onSaved: (input) => _password = input!,
                    obscureText: seePass,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.black, size: 24,),
                      hintText: "**********",
                      labelText: "Password",
                      suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.visibility,
                      ),
                      onPressed: (){
                        setState(() {
                          seePass = !seePass;
                        });
                      },
                      ),
                    ),
                  ),
                ),
          
                FutureBuilder(
                  future: getUsername(),
                  builder: (context, snapshot) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        controller: _newAlamat,
                        validator: (value) {
                          if (value!.isEmpty) {
                              return "Password tidak bisa kosong";
                            } else {
                              return null;
                            }
                        },
                        onSaved: (value) => _alamat = value!,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.house, color: Colors.black, size: 24,),
                          hintText: _oldAlamat,
                          labelText: "Alamat"
                        ),
                      ),
                    );
                  },
                ),
          
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Hapus Akun?",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w700,
                                fontSize: 36
                              ),
                          ),
                          content: const Text(
                            "Apakah Anda Yakin Untuk Hapus Akun? Seluruh Data Akun Akan Terhapus",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              ),
                          ),
                          actions: [
                            TextButton(onPressed: (() {
                              Navigator.of(context).pop();
                            }), child: const Text('Batal'),),
                            TextButton(onPressed: (() {
                              DeleteUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const LoginConfirm();
                                }));
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Akun Berhasil Dihapus', style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.black,
                              ));
                            }), child: const Text('Hapus'),)
                          ],
                        )
                      );
                    },
                    child: const Text(
                      "Hapus Akun",
                      style: TextStyle(
                        color: Color(0xFF838383),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
          
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: RoundedButton(
                    text: "Simpan",
                    press: () async {
                      final FormState = _formKey.currentState;
                      if (FormState!.validate()){
                        FormState.save();
                        try{
                          const CircularProgressIndicator();
                          updateData();
                          getUsername();
                          if (_image != null) {
                            uploadImage();
                          }
                          await FirebaseAuth.instance.currentUser?.updateEmail(_email).then((value) {});
                          await FirebaseAuth.instance.currentUser?.updatePassword(_password).then((value) {});
                          FirebaseAuth.instance.signOut;
                          await showDialog(context: context, builder: (context) => AlertDialog(
                            title: const Text(
                              "Update Berhasil",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w700,
                                fontSize: 28
                              ),
                            ),
                            content: const Text(
                              "Perubahan Berhasil Disimpan, Silahkan login kembali",
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
                            return const LoginConfirm();
                          })
                        );
                        } catch(e) {
                          print(e);
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Pilih Profile Photo",
            style: TextStyle(
              fontFamily: "Made-Tommy",
              fontWeight: FontWeight.w500,
              fontSize: 24
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () => pickImage(ImageSource.camera),
                style: TextButton.styleFrom(
                  primary: Colors.black
                ),
                label: const Text("Kamera"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () => pickImage(ImageSource.gallery),
                style: TextButton.styleFrom(
                  primary: Colors.black
                ),
                label: const Text("Galeri"),
              )
            ],
          )
        ],
      )
    );
  }
}
