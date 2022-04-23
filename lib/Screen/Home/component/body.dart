import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/components/rounded_button.dart';

// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [

//         ],
//       ),
//     );
//   }
// }

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

onSearch(String search) {
  print("Search");
}

class _BodyState extends State<Body> { 
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Vector_6.png"),
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Halo, Kinoy!",
                style: TextStyle(
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
                "Yang Lagi Trend Nih!",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Card(
                child: Container(
                  height: 150,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Expanded(
                            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6koevcEZnIoYkFYfR-OA69SsYQw7R3zKYIA&usqp=CAU"),
                            flex: 2,
                          ),
                        )
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text(
                                    "SagaraS",
                                    style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Akhirnya. Siapa orang tua Ali dijawab di buku ini. Ali, bertahun-tahun, berusaha memecahkan misteri itu. Raib dan Seli tentu tidak akan...",
                                    style: TextStyle(
                                      fontFamily: "Made-Tommy",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "Rp.81.000",
                              //   textAlign: TextAlign.justify,
                              //   style: TextStyle(
                              //     fontFamily: "Made-Tommy",
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 12
                              //   ),
                              // ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                                child: Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: OutlinedButton(
                                          child: Text(
                                            "Sewa",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary: Colors.black,
                                            backgroundColor: Colors.white,
                                            side: BorderSide(color: Colors.black, width: 3),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                            minimumSize: Size(20, 25)
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      OutlinedButton(
                                        child: Text(
                                          "Beli",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.black,
                                          side: BorderSide(color: Colors.black, width: 3),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                          minimumSize: Size(40, 25)
                                        ),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      )
    );
  }
}