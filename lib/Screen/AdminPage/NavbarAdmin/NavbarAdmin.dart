import 'package:flutter/material.dart';
import 'package:selibu/Screen/AdminPage/HomeAdmin/HomeAdmin.dart';
import 'package:selibu/Screen/EditProfile/EditProfile.dart';
import 'package:selibu/Screen/ListBuku/ListBuku.dart';
import 'package:selibu/Screen/ListSewa/ListSewa.dart';

class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final pages = [
    const HomeAdmin(),
    const ListBuku(),
    const ListSewa(),
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
              icon: Icon(Icons.payments),
              label: 'Daftar Beli',
            ),
            NavigationDestination(
              icon: Icon(Icons.note),
              label: 'Daftar Sewa',
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