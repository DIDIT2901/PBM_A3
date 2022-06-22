import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/SewaModel.dart';
import 'package:selibu/Screen/AdminPage/NavbarAdmin/NavbarAdmin.dart';
import 'package:selibu/Screen/Home/component/background.dart';
import 'package:intl/intl.dart';
import 'package:selibu/Screen/ListSewa/component/addSewa.dart';
import 'package:selibu/components/rounded_button.dart';

class BodySewaAdmin extends StatefulWidget {
  const BodySewaAdmin({Key? key}) : super(key: key);

  @override
  State<BodySewaAdmin> createState() => _BodyState();
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

class _BodyState extends State<BodySewaAdmin> {

  final Stream<QuerySnapshot> _HomeSewa = FirebaseFirestore.instance.collection('Sewa').snapshots();

  @override
  void initState(){
    _HomeSewa;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getUsername(),
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 00, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      "Halo, $_homeUsername!",
                      style: const TextStyle(
                          fontFamily: "Made-Tommy",
                          fontWeight: FontWeight.w700,
                          fontSize: 48),
                    ),
                  ),
                  const Text(
                    "Mau Nyari Apa Nih Hari Ini?",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
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
                      ),
                    ),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10), blurRadius: 20)
                    ]),
                  ),
                  const Text(
                    "Ini Nih List Buku Yang Kamu Sewa,",
                    style: TextStyle(
                      fontFamily: "Made-Tommy",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _HomeSewa,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text('Ada yang salah nih');
                        if (snapshot.connectionState == ConnectionState.waiting){
                          return const SizedBox(
                            child: CircularProgressIndicator(),
                            height: 10,
                            width: 10,
                          );
                        } else{
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, int index) {
                              DateTime TanggalTr = (snapshot.data!.docs[index]['Tanggal']).toDate();
                              String FormattedTanggal = DateFormat('dd MMM yyyy  kk:mm').format(TanggalTr);
                              return Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    height: 180,
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
                                      padding: const EdgeInsets.fromLTRB(110, 10, 20, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data!.docs[index]['Judul'],
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Peminjam : " + snapshot.data!.docs[index]['Peminjam'],
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Katergori : " + snapshot.data!.docs[index]['Kategori'],
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Tanggal : " + FormattedTanggal.toString(),
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Sisa Hari : " + snapshot.data!.docs[index]['SisaHari'].toString() + " Hari",
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Status : " + snapshot.data!.docs[index]['Status'],
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Denda : " + "Rp." + snapshot.data!.docs[index]['Denda'].toString(),
                                            style: const TextStyle(
                                                fontFamily: "Made-Tommy",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                            textAlign: TextAlign.justify,
                                          ),
                                          // const SizedBox(height: 10),
                                          Container(
                                              child: OutlinedButton(
                                                child: const Text(
                                                  "Selesai",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                    primary: const Color.fromRGBO(252, 241, 241, 1),
                                                    backgroundColor: Colors.black,
                                                    side: const BorderSide(color: Colors.black, width: 3),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(Radius.circular(30))),
                                                    minimumSize: const Size(30, 25)),
                                                onPressed: () async {
                                                  try{
                                                    String _UbahSatus = 'Telah Mengembalikan';

                                                    SewaModel sewaModel = SewaModel();
                                                    sewaModel.Status = _UbahSatus;

                                                    String? user = FirebaseAuth.instance.currentUser?.uid;
                                                    String? indexTransaksi = snapshot.data!.docs[index].id.toString();

                                                    await FirebaseFirestore.instance.collection('Sewa').doc(indexTransaksi).update({
                                                      'Status': _UbahSatus
                                                    });
                                                    await showDialog(context: context, builder: (context) =>AlertDialog(
                                                      title: const Text(
                                                        "Transaksi Selesai",
                                                        style: TextStyle(
                                                          fontFamily: "Made-Tommy",
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 28
                                                        ),
                                                      ),
                                                      content: const Text(
                                                        "Terima Kasih Telah Membeli Produk Kami >//<",
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
                                                        return const NavBarAdmin();
                                                      })
                                                    );
                                                  }catch(e){
                                                    print(e);
                                                  }
                                                },
                                              )
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 15,
                                    bottom: 15,
                                    child: ClipRRect(
                                      child: Image.network(
                                        snapshot.data!.docs[index]['Gambar'],
                                        width: 90,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: RoundedButton(
                      text: "Tambah Data Sewa",
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return const addSewa();
                          })
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
