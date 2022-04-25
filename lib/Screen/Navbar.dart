import 'package:flutter/material.dart';
import 'package:selibu/Screen/EditProfile/EditProfile.dart';
import 'package:selibu/Screen/Home/home.dart';
import 'package:selibu/Screen/ListBuku/ListBuku.dart';
import 'package:selibu/Screen/SwitchAcc/SwitchAcc.dart';

class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final pages = [
    HomeScreen(),
    ListBuku(),
    SwitchAcc(),
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
            TextStyle(
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
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            NavigationDestination(
              icon: Icon(Icons.switch_account),
              label: 'Switch',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
        )
      ),
    );
  }
}