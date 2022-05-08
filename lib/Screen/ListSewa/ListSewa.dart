import 'package:flutter/material.dart';
import 'package:selibu/Screen/ListSewa/component/body.dart';

class ListSewa extends StatefulWidget {
  const ListSewa({ Key? key }) : super(key: key);

  @override
  State<ListSewa> createState() => _SwitchAccState();
}

class _SwitchAccState extends State<ListSewa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}