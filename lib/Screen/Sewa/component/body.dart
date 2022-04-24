import 'package:flutter/material.dart';
import 'package:selibu/Screen/Sewa/component/list_sewa.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

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
                      fontSize: 36),
                ),
                Text(
                  "Pilih Tempat Sewanya Dulu Gih!",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
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
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          TextEditingController().clear();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Cari...",
                      hintStyle:
                          TextStyle(fontSize: 14, color: Color(0xFF838383)),
                      // icon: Icon(Icons.qr_code)
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.10), blurRadius: 20)
                  ]),
                ),
                Text(
                  "Hayuk Pilih Tokonya,",
                  style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: storeList.length,
                        itemBuilder: (context, index) {
                          Stores store = storeList[index];
                          return Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                height: 170,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.10),
                                          blurRadius: 20)
                                    ]),
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(250, 10, 20, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          store.nama,
                                          style: TextStyle(
                                              fontFamily: "Made-Tommy",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                        // SizedBox(height: 10),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.home),
                                            Text(store.tempat,
                                                style: TextStyle(
                                                  fontFamily: "Made-Tommy",
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ],
                                        ),

                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.add_road_outlined),
                                            Text(store.jarak,
                                                style: TextStyle(
                                                  fontFamily: "Made-Tommy",
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.timer),
                                            Text(store.waktu,
                                                style: TextStyle(
                                                  fontFamily: "Made-Tommy",
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.phone),
                                            Text(store.telepon,
                                                style: TextStyle(
                                                  fontFamily: "Made-Tommy",
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                              Positioned(
                                  right: 20,
                                  top: 15,
                                  bottom: 20,
                                  child: Icon(Icons.check_box_outline_blank)),
                              Positioned(
                                left: 20,
                                top: 15,
                                bottom: 15,
                                child: ClipRRect(
                                  child: Image(
                                    width: 200,
                                    height: 200,
                                    image: AssetImage(store.image),
                                  ),
                                ),
                              )
                            ],
                          );
                        }))
              ],
            ),
          ),
        ));
  }
}
