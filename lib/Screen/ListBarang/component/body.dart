import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Data/Buku.dart';


class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

onSearch(String search) {
  print("Search");
}

var _homeUsername;
Future getUsername() async{
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user != null) {
        await FirebaseFirestore.instance.collection('Users').doc(user).get().then((value) {
          _homeUsername = (value.data()!['Username']);
        });
      }
    }

class _BodyState extends State<Body> { 
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/Vector_6.png"),
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
        body: FutureBuilder(
          future: getUsername(),
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Halo, $_homeUsername",
                    style: const TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 48
                    ),
                  ),
                  Text(
                    "Mau Nyari Apa Nih Hari Ini?",
                    style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w400,
                      fontSize: 24
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextField(
                      onChanged: (value) => onSearch(value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.black, size: 24,),
                        suffixIcon: IconButton(
                          onPressed: () {
                            TextEditingController().clear();
                          },
                          icon: Icon(Icons.clear, color: Colors.black,),
                        ),
                        hintText: "Cari...",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF838383)
                        ),
                        // icon: Icon(Icons.qr_code)
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 20
                        )
                      ]
                    ),
                  ),
                  Text(
                    "Ini Nih List Barangmu!",
                    style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  // ListView.builder(
                  //   itemCount: bookList.length,
                  //   itemBuilder: (context, index) {
                  //     Books buku = bookList[index];
                  //     return Card(
                  //     );
                  //   }
                  // )
                ],
              ),
            );
          }
        ),
      )
    );
  }
}