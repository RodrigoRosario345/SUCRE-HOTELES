// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:hotel/utils/constans.dart';
import 'package:hotel/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class HotelLocationScreen extends StatefulWidget {
  const HotelLocationScreen({super.key});

  @override
  State<HotelLocationScreen> createState() => _HotelLocationScreenState();
}

class _HotelLocationScreenState extends State<HotelLocationScreen> {
  Completer<GoogleMapController> googleMapController = Completer();
  List<LatLng> posiciones = [];
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};
  CameraPosition initialCameraPosition = const CameraPosition(
    zoom: 16,
    target: LatLng(-19.05078849404707, -65.25658517148824),
  );
  late BitmapDescriptor icon;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    posiciones.addAll(
      [
        const LatLng(-19.05078849404707, -65.25658517148824),
      ],
    );
    await setIcon();
    setMarkers();
    setPolylines();
  }

  Future<void> setIcon() async {
    Uint8List iconBytes = await Utils.getBytesFromAsset(kMarker, 120);
    icon = BitmapDescriptor.fromBytes(iconBytes);
  }

  void setMarkers() {
    posiciones.forEach((posicion) {
      markers.add(
        Marker(
          markerId: MarkerId(posicion.toString()),
          position: posicion,
          icon: icon,
          infoWindow: InfoWindow(
            title: DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now()),
          ),
        ),
      );
    });
    setState(() {});
  }

  void setPolylines() {
    polylines.add(
      Polyline(
        polylineId: const PolylineId('id'),
        points: posiciones,
        width: 4,
        color: Colors.purple,
      ),
    );
    moverCamara(posiciones.last);
    setState(() {});
  }

  void addMarker(LatLng nuevaPosicion) {
    LatLng ultimaPosicion = markers.last.position;
    markers.add(
      Marker(
        markerId: MarkerId(nuevaPosicion.toString()),
        position: nuevaPosicion,
        icon: icon,
        infoWindow: InfoWindow(
          title: DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now()),
        ),
      ),
    );
    polylines.add(
      Polyline(
        polylineId: PolylineId(nuevaPosicion.toString()),
        points: [ultimaPosicion, nuevaPosicion],
        width: 4,
        color: Colors.green,
        patterns: [
          PatternItem.dot,
          PatternItem.gap(10),
        ],
      ),
    );
    moverCamara(nuevaPosicion);
    setState(() {});
  }

  Future<void> moverCamara(LatLng posicion) async {
    final controller = await googleMapController.future;
    controller.animateCamera(CameraUpdate.newLatLng(posicion));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Maps'),
      ),
      body: SafeArea(
        child: GoogleMap(
          markers: markers,
          polylines: polylines,
          mapType: MapType.normal,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            googleMapController.complete(controller);
          },
          onTap: (LatLng posicion) {
            addMarker(posicion);
          },
        ),
      ),
    );
  }
}
