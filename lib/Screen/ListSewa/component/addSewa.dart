import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:selibu/Model/SewaModel.dart';
import 'package:selibu/Screen/AdminPage/NavbarAdmin/NavbarAdmin.dart';

class addSewa extends StatefulWidget {
  const addSewa({Key? key}) : super(key: key);

  @override
  State<addSewa> createState() => _addSewaState();
}

List<String> listJudul = [];
List<String> listUser = [];

loadJudul() async{
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Buku').get();
  listJudul = querySnapshot.docs.map((doc) => doc.get('Judul').toString()).toList();
}

loadUser() async{
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Users').get();
  listUser = querySnapshot.docs.map((doc) => doc.get('Username').toString()).toList();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
void initState(){
  loadJudul();
  loadUser();
}

String? Gambar_, Judul_, Kategori_, Pembeli, Status_;
int? Denda_, SisaHari_;
DateTime? Tanggal_;

class _addSewaState extends State<addSewa> {
  String? selectedBuku;
  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/Images/Vector_7.png"),
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
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Text(
                    "Tambah Buku Baru",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w700,
                        fontSize: 36),
                  ),
                  const Text(
                    "Pastiin Produknya Benar Ya",
                    style: TextStyle(
                        fontFamily: "Made-Tommy",
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
                  ),
                  FutureBuilder(
                    future: loadJudul(),
                    builder: (context, snapshot){
                      loadJudul();
                      loadUser();
                      return Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text('Pilih Buku'),
                          items: listJudul.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          )).toList(),
                          value: selectedBuku,
                          onChanged: (val){
                            setState(() {
                              selectedBuku = val.toString();
                            });
                            print('selectedBuku: $selectedBuku');
                          },
                        ),
                      )
                    );
                    },
                  ),
                  FutureBuilder(
                    future: loadUser(),
                    builder: (context, snapshot){
                      return Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text('Pilih User'),
                          items: listUser.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          )).toList(),
                          value: selectedUser,
                          onChanged: (val) {
                            setState(() {
                              selectedUser = val.toString();
                            });
                            print('selectedUser: $selectedUser');
                          },
                        ),
                      )
                    );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                          return "Durasi tidak bisa kosong";
                        } else {
                          return null;
                        }
                        },
                      onSaved: (value) => SisaHari_ = int.parse(value!),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "0", labelText: "Durasi Peminjaman"),
                    ),
                  ),
                  SizedBox(height: 60),
                  OutlinedButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: const Color.fromRGBO(252, 241, 241, 1),
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black, width: 3),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      minimumSize: const Size(40, 45)),
                    onPressed: () async{
                      final FormState = _formKey.currentState;
                      if (FormState!.validate()){
                        FormState.save();
                        try{
                          const CircularProgressIndicator();
                          var nomorBuku;
                          final loadGambar = await FirebaseFirestore.instance.collection('Buku').where('Judul', isEqualTo: selectedBuku.toString()).get().then((value) {
                            Gambar_ = value.docs[0].data()['Gambar'].toString();
                          });

                          print('Okey');
                          Tanggal_ = DateTime.now();
                          Denda_ = 0;

                          SewaModel sewaModel = SewaModel();

                          sewaModel.Judul = selectedBuku;
                          sewaModel.Denda = Denda_;
                          sewaModel.Gambar = Gambar_;
                          sewaModel.SisaHari = SisaHari_;
                          sewaModel.Tanggal = Tanggal_;
                          sewaModel.Peminjam = selectedUser;
                          
                          FirebaseFirestore.instance.collection('Sewa').doc().set({
                            'Judul': selectedBuku,
                            'Denda': Denda_,
                            'Gambar': Gambar_,
                            'Kategori': 'Peminjaman',
                            'Peminjam': selectedUser.toString(),
                            'SisaHari': SisaHari_,
                            'Status': 'Sedang Meminjam',
                            'Tanggal': Tanggal_
                          });
                          await showDialog(context: context, builder: (context) => AlertDialog(
                            title: const Text(
                              "Sukses Menambah",
                              style: TextStyle(
                                fontFamily: "Made-Tommy",
                                fontWeight: FontWeight.w700,
                                fontSize: 28
                              ),
                            ),
                            content: const Text(
                              "Data sewa baru sukses ditambahkan!",
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
                            return const NavBarAdmin();
                          })
                        );
                        } catch(e){
                          print(e);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}