import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class listMaps extends StatefulWidget {

  double langti, longti;
  String? namaToko;

  listMaps({
    Key? key,
    required this.langti,
    required this.longti,
    required this.namaToko
  }) : super(key: key);

  @override
  State<listMaps> createState() => _listMapsState(
    langti, longti, namaToko
  );
}

class _listMapsState extends State<listMaps> {

  _listMapsState(this._langti, this._longti, this._namaToko);

  List<Marker> markers = [];

  double _langti, _longti;
  String? _namaToko;

  GoogleMapController? _googleMapController;
  

  @override
  void dispose() {
    _googleMapController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _initialCameraPosition = CameraPosition(
      target: LatLng(_langti, _longti),
      zoom: 18
    );

    final _lokasiToko = Marker(
      markerId: MarkerId(_namaToko.toString()),
      position: LatLng(_langti, _longti),
      draggable: false,
      infoWindow: InfoWindow(
        title: _namaToko
      )
    );

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "$_namaToko",
                  style: const TextStyle(
                    fontFamily: "Made-Tommy",
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black
                    ),
              ),
              const Text(
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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,

          markers: <Marker>{_lokasiToko},
          onMapCreated: (controller) => _googleMapController = controller,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          ),
          child: const Icon(Icons.center_focus_strong, color: Colors.black,),
        ),
      ),
    );
  }
}
