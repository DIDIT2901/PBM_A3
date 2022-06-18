import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/UserModel.dart';
import 'package:selibu/Screen/Login/component/background.dart';
import 'package:selibu/Screen/Login/component/body.dart';
import 'package:selibu/Screen/Navbar.dart';
import 'package:selibu/Screen/SignUp/signup_screen.dart';
import 'package:selibu/components/rounded_button.dart';

bool seePass = true;

class SignUpConfirm extends StatefulWidget {
  const SignUpConfirm({Key? key}) : super(key: key);
  @override
  State<SignUpConfirm> createState() => _SignUpConfirmState();
}

class _SignUpConfirmState extends State<SignUpConfirm> {

  // Initailize Firebase
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Body();
          }
          return const Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String  _email, _password;
  String? _username, _alamat;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // Textfield Controller
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _alamatController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Background(
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Selamat Datang Di Selibu",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w700,
                  fontSize: 28
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const Text(
                "Yuk, Bikin Akunmu Sendiri!",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w400,
                  fontSize: 24
                ),
              ),
        
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 20
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username tidak bisa kosong";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => _username = value!,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person_outline_outlined,
                      color: Color(0XFF838383),
                    ),
                    hintText: "Username",
                    border: InputBorder.none
                  ),
                ),
              ),
        
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 20
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: _alamatController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Alamat tidak bisa kosong";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => _alamat = value!,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.home,
                      color: Color(0XFF838383),
                    ),
                    hintText: "Alamat",
                    border: InputBorder.none
                  ),
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 20
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: _emailController,
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
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0XFF838383),
                    ),
                    hintText: "Email",
                    border: InputBorder.none
                  ),
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 20
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: seePass,
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
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: const Icon(
                      Icons.lock,
                      color: Color(0xFF838383),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.visibility,
                        color: Color(0xFF838383),
                      ),
                      onPressed: (){
                        setState(() {
                          seePass = !seePass;
                        });
                      },
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
              
              RoundedButton(
                text: "KUY DAFTAR",
                press: () async{
                  final FormState = _formKey.currentState;
                  if(FormState!.validate()){
                    FormState.save();
                    try{
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)
                      .then((value) async {
                        User? user = FirebaseAuth.instance.currentUser;
                        UserModel userModel = UserModel();

                        userModel.Username = _username;
                        userModel.Alamat = _alamat;

                        await FirebaseFirestore.instance.collection('Users').doc(user!.uid).set({
                          'Username': _username,
                          'Alamat': _alamat,
                          'Role': 'User',
                        });
                      });

                      await showDialog(context: context, builder: (context) =>AlertDialog(
                        title: const Text(
                          "Telah Berhasil Daftar",
                          style: TextStyle(
                            fontFamily: "Made-Tommy",
                            fontWeight: FontWeight.w700,
                            fontSize: 28
                          ),
                        ),
                        content: const Text(
                          "Akunmu berhasil didaftarkan!",
                          style: TextStyle(
                            fontFamily: "Made-Tommy",
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                          ),
                        ),
                        actions: [TextButton(onPressed: () {
                          Navigator.of(context).pop();
                        },child: Text('OK'),)],
                      ));
                      Navigator.of(context).pop();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const NavBar();
                        })
                      );
                    }catch(e){
                      print(e);
                    }
                  }
                },
              ),
              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginConfirm();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Udah Punya Akun?",
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    decoration: TextDecoration.underline
                  ),
                ),
              )
            ],
          ),
          ]
        ),
      ),
    );
  }
}