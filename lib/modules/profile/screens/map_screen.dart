import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  final Function(String positon) onSelected;
  const MapScreen({super.key, required this.onSelected});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedPosition;
  MapController _mapController = MapController();

  List<Marker> markers = [];

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    selectedPosition = LatLng(position.latitude, position.longitude);

    _mapController.move(LatLng(position.latitude, position.longitude), 14);

    markers.add(
      Marker(
        point: LatLng(position.latitude, position.longitude),
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 50,
        ),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    determinePosition();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'انتخاب آدرس از روی نقشه'),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: LatLng(35.730527, 51.8462604),
                    initialZoom: 14,
                    onTap: (tapPosition, point) {
                      markers.clear();
                      markers.add(Marker(
                        point: point,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ));
                      selectedPosition = point;

                      setState(() {});
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    MarkerLayer(
                      markers: markers,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonPrimary(
              text: 'ثبت موقعیت مکانی',
              onPressed: () {
                widget.onSelected(
                    '${selectedPosition!.latitude},${selectedPosition!.longitude}');
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
