import 'package:flutter/material.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:selibu/Data/Buku.dart';

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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sewa Apa Tuh?",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w700,
                  fontSize: 36
                ),
              ),
              Text(
                "Pilih Tempat Sewanya Dulu Gih!",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w400,
                  fontSize: 20
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
                "Hayuk Pilih Tokonya,",
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
        ),
      )
    );
  }
}