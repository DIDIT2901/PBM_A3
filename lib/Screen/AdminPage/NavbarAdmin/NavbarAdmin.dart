import 'package:flutter/material.dart';
import 'package:selibu/Screen/EditProfile/EditProfile.dart';
import 'package:selibu/Screen/Home/homeAdmin.dart';
import 'package:selibu/Screen/ListSewa/component/bodySewaAdmin.dart';
import 'package:selibu/Screen/TambahProduk/TambahProduk.dart';

class NavBarAdmin extends StatefulWidget {
  const NavBarAdmin({ Key? key }) : super(key: key);

  @override
  State<NavBarAdmin> createState() => _NavBarState();
}

class _NavBarState extends State<NavBarAdmin> {
  int index = 0;
  final pages = [
    HomeScreenAdmin(),
    TambahProduk(),
    const BodySewaAdmin(),
    EditProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.grey,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: "Made-Tommy",
              fontWeight: FontWeight.w600,
              fontSize: 14
            )
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index=index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(Icons.my_library_add),
              label: 'Tambah Buku',
            ),
            NavigationDestination(
              icon: Icon(Icons.note),
              label: 'Transaksi',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Akun',
            )
          ],
        )
      ),
    );
  }
}