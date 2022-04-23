import 'package:flutter/material.dart';
import 'package:selibu/constants.dart';
import 'package:selibu/Screen/Sewa/component/body.dart';

class _PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<_PageList> {
  List<String> toko = [
    "Cabang Sumbersari",
    "Cabang Kaliwates",
    "Cabang Patrang",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView.builder(
        itemCount: toko.length,
        itemBuilder: (BuildContext context, int index) {
          final number = index + 1;
          final store = toko[index].toString();
          return Card(
            child: ListTile(
              leading: Text(number.toString()),
              title: Text(store),
              trailing: Icon(Icons.check_box),
            ),
          );
        },
      ),
    );
  }
}
