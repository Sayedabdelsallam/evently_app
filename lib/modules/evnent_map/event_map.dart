import 'package:evently_app/core/manger/location_manger.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMap extends StatefulWidget {
  const EventMap({super.key});

  @override
  State<EventMap> createState() => _EventMapState();
}

class _EventMapState extends State<EventMap> {
  var initialCameraPosition = CameraPosition(
  zoom: 5,
  target: LatLng(
  50.3333,
  50.45),
  );
  late GoogleMapController _controller;
  Marker currentMarker = Marker(
    markerId: MarkerId('1'),
    position:  LatLng(
        50.3333,
        50.45),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        Position location = await LocationManger.getCurrentLocation();
        _listenLocationChanges();
        currentMarker = Marker(
          markerId: MarkerId('1'),
          position:  LatLng(
              location.latitude,
              location.longitude),
        );
        _controller.animateCamera(
          CameraUpdate.newLatLng(initialCameraPosition.target),
        );
        setState(() {});
        },
        child: const Icon(Icons.location_searching_rounded),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        key: UniqueKey(),
        onMapCreated: (controller)
        {
          _controller = controller;
        },
        markers: {currentMarker},
        initialCameraPosition: initialCameraPosition,
        ),
    );
  }
  _listenLocationChanges() async
  {
    Stream<Position> stream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 1000),
      ),
    );
    stream.listen(
      (Position newLocation)
        {
          var newLatLang = LatLng(
            newLocation.latitude,
            newLocation.longitude,
          );
          _controller.animateCamera(
            CameraUpdate.newLatLngZoom(
              newLatLang,
             10,
            ),
          );
          currentMarker = Marker(
            markerId: MarkerId('1'),
            position: newLatLang,
          );
          setState(() {});
        },
    );
  }
  }
