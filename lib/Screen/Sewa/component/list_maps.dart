import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class listMaps extends StatefulWidget {
  @override
  State<listMaps> createState() => _listMapsState();
}

class _listMapsState extends State<listMaps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Text(
                "Pustaka Karya",
                style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w700,
                    fontSize: 36),
              ),
              Text(
                "Nih lokasi tokonya",
                style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              Positioned(
                  left: 20,
                  top: 15,
                  bottom: 15,
                  child: Icon(CupertinoIcons.person_fill)),
              Row(
                children: <Widget>[
                  FlutterMap(
                      options: MapOptions(
                          center: LatLng(-8.1738588, 113.6973692), zoom: 14.0),
                      layers: [
                        TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a'])
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
