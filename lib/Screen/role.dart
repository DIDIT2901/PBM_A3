import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selibu/Model/UserModel.dart';
import 'package:selibu/Screen/AdminPage/NavbarAdmin/NavbarAdmin.dart';
import 'package:selibu/Screen/Navbar.dart';

class roleCheck extends StatefulWidget {
  const roleCheck({Key? key}) : super(key: key);

  @override
  State<roleCheck> createState() => _roleCheckState();
}

class _roleCheckState extends State<roleCheck> {
  UserModel? userDetails;

  var adminCheck;

  getUsername() async{
    final user = FirebaseAuth.instance.currentUser?.uid;
    if (user != null) {
      await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
        if(mounted) {
          this.adminCheck = (value.data()!['Role']);
        }
      });
    }
  }

  routing() {
    if (adminCheck == 'Admin') {
        return const NavBarAdmin();
      } if (adminCheck == 'User') {
        return const NavBar();
      } if (adminCheck == null) {
        return NavBar();
      }
  }

  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return FutureBuilder(
      future: getUsername(),
      builder: (context, snapshot) {
        return routing();
      },
    );
  }
}