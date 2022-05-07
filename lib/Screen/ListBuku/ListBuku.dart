import 'package:flutter/material.dart';
import 'package:selibu/Screen/ListBuku/components/body.dart';

class ListBuku extends StatefulWidget {
  const ListBuku({ Key? key }) : super(key: key);

  @override
  State<ListBuku> createState() => _ListBukuState();
}

class _ListBukuState extends State<ListBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}