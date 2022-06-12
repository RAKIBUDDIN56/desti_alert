import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var marker = <Marker>{}.obs;
  var pinLatitude = 0.0.obs;
  var pinLongitude = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getPINCoordinates(double lat, double lon) {
    pinLatitude.value = lat;
    pinLongitude.value = lon;

    print(pinLatitude.value);
  }

  void mapMarker(double lat, double lon) {
    latitude.value = lat;
    longitude.value = lon;
    Set<Marker> mar = {
      Marker(
        markerId: const MarkerId('markerID'),
        position: LatLng(latitude.value, longitude.value),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      )
    };
    marker.value = mar;
  }
}
