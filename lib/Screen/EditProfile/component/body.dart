import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:selibu/Screen/EditProfile/component/background.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

bool seePass = true;

class _BodyState extends State<Body> {
  
  File? _image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this._image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
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

              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 70.0,
                        child: ClipOval(
                          child: (_image != null)
                          ? Image.file(_image!, width: 250, height: 250 ,fit: BoxFit.cover,)
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
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.black, size: 24,),
                    hintText: "Kinoy",
                    labelText: "Username"
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.black, size: 24,),
                    hintText: "enjoykinoy7@gmail.com",
                    labelText: "Email"
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
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

              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.house, color: Colors.black, size: 24,),
                    hintText: "Perum Punden Ayem, Kec.SumberSari, Kota Jember",
                    labelText: "Alamat"
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
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

              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: RoundedButton(
                  text: "Simpan",
                  press: () {},
                ),
              )
            ],
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
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }
}
