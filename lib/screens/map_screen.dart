import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:quick_deliver/helper/constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  final String orsApiKey =
      '5b3ce3597851110001cf6248af343f0ed12a42d1917244adfb098a42';
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(userLocation.latitude!, userLocation.longitude!),
            child:
                const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
          ),
        );
      });
    } on Exception {
      currentLocation = null;
    }
    location.onLocationChanged.listen((LocationData newLocation) {
      if (!mounted) return;
      setState(() {
        currentLocation = newLocation;
      });
    });
  }

  Future<void> _getRoute(LatLng destination) async {
    if (!mounted) return;
    if (currentLocation == null) return;
    final start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];
      setState(() {
        routePoints =
            coords.map((coord) => LatLng(coord[1], coord[0])).toList();
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: destination,
            child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
          ),
        );
      });
    } else {
      // Handle errors
      print('Failed to fetch route');
    }
  }

  Future<void> _getAddressFromCoordinates(LatLng point) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${point.latitude}&lon=${point.longitude}';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'accept-language': 'en',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String address = data['display_name'];
        setState(() {
          markers.clear();
          markers.add(
            Marker(
              width: 80.0,
              height: 80.0,
              point: point,
              child:
                  const Icon(Icons.location_on, color: Colors.red, size: 40.0),
            ),
          );
        });
        Navigator.pop(context, address);
      } else {
        print('Failed to fetch address');
      }
    } catch (e) {
      print('Error fetching address: $e');
    }
  }

  void _addDestinationMarker(LatLng point) {
    _getAddressFromCoordinates(point);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(68),
          child: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 18, 42, 82),
            title: const Text(
              'Street Map',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text(
                  'Tap on the map to select your location.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        body: currentLocation == null
            ? const Center(child: CircularProgressIndicator())
            : FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  initialZoom: 15.0,
                  onTap: (tapPosition, point) => _addDestinationMarker(point),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: markers,
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routePoints,
                        strokeWidth: 4.0,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          elevation: 30,
          focusColor: const Color.fromARGB(255, 18, 42, 82),
          backgroundColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          onPressed: () {
            if (currentLocation != null) {
              mapController.move(
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                15.0,
              );
            }
          },
          child: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
