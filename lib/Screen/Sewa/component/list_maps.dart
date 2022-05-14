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
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                "Pustaka Karya",
                  style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black
                    ),
              ),
              Text(
                "Nih lokasi tokonya!",
                style: TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black
                    ),
              ),
            ],
          ),
          toolbarHeight: 120,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(-8.1738588, 113.6973692), zoom: 14.0),
          layers: [
            TileLayerOptions(
              urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a']),
          ],
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Kembali",
                        style: TextStyle(
                            fontFamily: "Made-Tommy",
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black
                            ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
          ),
      ),
    );
  }
}
