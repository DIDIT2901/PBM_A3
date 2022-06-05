import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Screen/Sewa/component/list_maps.dart';
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

  final Stream<QuerySnapshot> _tokoSewa = FirebaseFirestore.instance.collection('Toko').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/Images/Vector_6.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 30,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sewa Apa Tuh?",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 36),
                ),
                const Text(
                  "Pilih Tempat Sewanya Dulu Gih!",
                  style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                    onChanged: (value) => onSearch(value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          TextEditingController().clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Cari...",
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Color(0xFF838383)),
                      // icon: Icon(Icons.qr_code)
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.10), blurRadius: 20)
                  ]),
                ),
                const Text(
                  "Hayuk Pilih Tokonya,",
                  style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),

                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _tokoSewa,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text('Ada yang salah nih');
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return const SizedBox(
                          child: CircularProgressIndicator(),
                          height: 10,
                          width: 10,
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, index) {
                            return Stack(
                              children: <Widget> [
                                InkWell(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  height: 140,
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
                                          const EdgeInsets.fromLTRB(128, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data?.docs[index]['Cabang'],
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          // SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              const Icon(Icons.home, size: 20,),
                                              const Padding(padding: EdgeInsets.all(3)),
                                              Text(snapshot.data?.docs[index]['Alamat'],
                                                  style: const TextStyle(
                                                    fontFamily: "Made-Tommy",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12
                                                  )),
                                            ],
                                          ),
                              
                                          Row(
                                            children: <Widget>[
                                              const Icon(Icons.add_road, size: 20,),
                                              const Padding(padding: EdgeInsets.all(3)),
                                              Text(snapshot.data?.docs[index]['Jalan'],
                                                  style: const TextStyle(
                                                    fontFamily: "Made-Tommy",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              const Icon(Icons.timer, size: 20,),
                                              const Padding(padding: EdgeInsets.all(3)),
                                              Text((snapshot.data?.docs[index]['JamBuka'].toString())!+':'+(snapshot.data?.docs[index]['MenitBuka'].toString())!+' - '+(snapshot.data?.docs[index]['JamTutup'].toString())!+':'+(snapshot.data?.docs[index]['MenitTutup'].toString())!,
                                                  style: const TextStyle(
                                                    fontFamily: "Made-Tommy",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              const Icon(Icons.phone, size: 20,),
                                              const Padding(padding: EdgeInsets.all(3)),
                                              Text('${snapshot.data?.docs[index]['CP']}',
                                                  style: const TextStyle(
                                                    fontFamily: "Made-Tommy",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12
                                                  )),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return listMaps();
                                      },
                                    ),
                                  );
                                },
                              ),
                              // ],
                            Positioned(
                                left: 20,
                                top: 15,
                                bottom: 15,
                                child: ClipRRect(
                                  child: Image.network(
                                    snapshot.data!.docs[index]['Gambar'],
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              )
                              ]
                            );
                          },
                        );
                      }
                    },
                  ),
                )

                // Expanded(
                //     child: ListView.builder(
                //         itemCount: storeList.length,
                //         itemBuilder: (context, index) {
                //           Stores store = storeList[index];
                //           return Stack(
                //             children: <Widget>[
                //               
                //               // Positioned(
                //               //     right: 20,
                //               //     top: 15,
                //               //     bottom: 20,
                //               //     child: Icon(Icons.check_box_outline_blank)),
                //               Positioned(
                //                 left: 20,
                //                 top: 15,
                //                 bottom: 15,
                //                 child: ClipRRect(
                //                   child: Image(
                //                     width: 100,
                //                     height: 100,
                //                     image: AssetImage(store.image),
                //                   ),
                //                 ),
                //               )
                //             ],
                //           );
                //         }))
              ],
            ),
          ),
        ));
  }
}
