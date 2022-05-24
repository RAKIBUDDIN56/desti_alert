import 'dart:async';
import 'package:desti_alert/constants/size_config.dart';
import 'package:desti_alert/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:flutter/services.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static const CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(22.8013822, 89.5342847), zoom: 14);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = Get.find<AuthController>();
  final Completer<GoogleMapController> _googleMapController = Completer();

  late GoogleMapController newGoogleMapController;

  late geo.Position currentPosition;

  Future<String> getMapJson(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    newGoogleMapController.setMapStyle(mapStyle);
  }

  void changeMapStyle() {
    print('called');
    getMapJson('assets/json/map_style.json')
        .then((value) => setMapStyle(value));

    print('end');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          //google map
          ___googleMap(),

          Positioned(
              top: 40,
              right: 20,
              child: Container(
                // height: 29,
                // width: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.green,
                    )),
                child: Center(
                  child: IconButton(
                    onPressed: __locateCurrentPosition,
                    icon: Icon(Icons.my_location),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget ___googleMap() {
    return GoogleMap(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      //mapType: MapType.terrain,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      trafficEnabled: true,
      buildingsEnabled: true,
      // circles: geofenceController.circle,
      // markers: geofenceController.geofenceMarker,
      initialCameraPosition: OnBoardScreen._initialCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        // _googleMapController.complete(controller);
        newGoogleMapController = controller;
        changeMapStyle();

        __locateCurrentPosition();
        setState(() {});
      },
    );
  }

  void __locateCurrentPosition() async {
    await geo.Geolocator.checkPermission();
    await geo.Geolocator.requestPermission();
    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
    currentPosition = position;
    // LatLng latLatPosition = LatLng(
    //     geofenceController.latitude.value, geofenceController.longitude.value);
    LatLng latLngPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    await newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
