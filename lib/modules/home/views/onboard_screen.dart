import 'dart:async';
import 'package:desti_alert/constants/constants.dart';
import 'package:desti_alert/constants/size_config.dart';
import 'package:desti_alert/modules/auth/controllers/auth_controller.dart';
import 'package:desti_alert/modules/home/controllers/map_controller.dart';
import 'package:desti_alert/shared_components/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';

import 'package:map_picker/map_picker.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static const CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(22.8013822, 89.5342847), zoom: 14);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = Get.find<AuthController>();
  final mapController = Get.find<MapController>();
  final Completer<GoogleMapController> _googleMapController = Completer();
  MapPickerController mapPickerController = MapPickerController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late GoogleMapController newGoogleMapController;
  late geo.Position currentPosition;
  bool isVisibleSearchButton = false;
  final _searchTextFielController = TextEditingController();
  final _controller = Completer<GoogleMapController>();

  Future<String> getMapJson(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    newGoogleMapController.setMapStyle(mapStyle);
  }

  void changeMapStyle() {
    getMapJson('assets/json/map_style.json')
        .then((value) => setMapStyle(value));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
      ),
      key: scaffoldKey,
      drawer: const NavDrawer(),
      body: Stack(
        children: [
          //google map
          // ___googleMap(),
          ___googleMapNew(),

          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),

          Positioned(
              top: 40,
              right: 40,
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
                    icon: const Icon(Icons.my_location),
                  ),
                ),
              )),
          Positioned(top: 100, right: 15, left: 15, child: ___searchWidget()),
          Positioned(
              top: 170,
              left: 50,
              child: Visibility(
                visible: isVisibleSearchButton,
                child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text('Search')),
              )),
        ],
      ),
    );
  }

  void getLocationCoordinates() async {
    List<Location> coordinates =
        await locationFromAddress(_searchTextFielController.text.trim());
    print(coordinates.first.latitude);
    mapController.latitude.value = coordinates.first.latitude;
    mapController.longitude.value = coordinates.first.longitude;
    mapController.mapMarker(
        coordinates.first.latitude, coordinates.first.longitude);
    setState(() {});
  }

  Widget ___searchWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            splashColor: Colors.grey,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _searchTextFielController,
              cursorColor: Colors.black,
              cursorWidth: 2.5,
              cursorHeight: 25,
              autofocus: false,
              onTap: () => ___searchButton(),
              onSubmitted: (value) async {
                setState(() {
                  isVisibleSearchButton = !isVisibleSearchButton;
                });
                FocusScope.of(context).unfocus();
                getLocationCoordinates();
              },
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  hintText: "Search...",
                  helperStyle: TextStyle(fontSize: 20)),
            ),
          ),
          Visibility(
              visible: isVisibleSearchButton,
              child: IconButton(
                icon: const Icon(
                  Icons.close,

                  //color: Colors.,
                  size: 30,
                ),
                onPressed: () {
                  _searchTextFielController.text = '';
                  setState(() {
                    isVisibleSearchButton = !isVisibleSearchButton;
                    FocusScope.of(context).unfocus();
                  });
                },
              ))
        ],
      ),
    );
  }

  void ___searchButton() {
    setState(() {
      isVisibleSearchButton = !isVisibleSearchButton;
    });
  }

// new map
  Widget ___googleMapNew() {
    return MapPicker(
      // pass icon widget
      iconWidget: Image.asset(
        "assets/images/pin.png",
        height: 60,
      ),
      //add map picker controller
      mapPickerController: mapPickerController,
      child: GoogleMap(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: true,
        buildingsEnabled: true,
        // mapType: MapType.terrain,
        //  camera position
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          newGoogleMapController = controller;
          changeMapStyle();

          __locateCurrentPosition();
          setState(() {});
        },
        onCameraMoveStarted: () {
          // notify map is moving
          mapPickerController.mapMoving!();
          _searchTextFielController.text = "Wait, loading ...";
        },
        onCameraMove: (cameraPosition) {
          this.cameraPosition = cameraPosition;
        },
        onCameraIdle: () async {
          // notify map stopped moving
          mapPickerController.mapFinishedMoving!();
          //get address name from camera position
          List<Placemark> placemarks = await placemarkFromCoordinates(
            cameraPosition.target.latitude,
            cameraPosition.target.longitude,
          );
          mapController.getPINCoordinates(
              cameraPosition.target.latitude, cameraPosition.target.longitude);

          // update the ui with the address
          _searchTextFielController.text =
              '${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.administrativeArea}';
        },
      ),
    );
  }

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(22.8013822, 89.5342847),
    zoom: 14.4746,
  );

  Widget ___googleMap() {
    return GoogleMap(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      //mapType: MapType.terrain,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      trafficEnabled: true,
      buildingsEnabled: true,
      //circles: mapController.circle,
      markers: mapController.marker,
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
    //  print(locations);
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
