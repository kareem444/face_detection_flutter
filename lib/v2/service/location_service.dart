import 'package:face_recongantion/v2/helper/check_location_enabled_helper.dart';
import 'package:face_recongantion/v2/controller/location_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class LocationService {
  static Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    await CheckLocationEnabledHelper.check();
    LocationData locationData = await location.getLocation();
    return locationData;
  }

  static void addMarkForAllStudent(BuildContext context, List users) {
    context.read<LocationProvider>().removeAllMarks();
    for (var userModel in users) {
      context.read<LocationProvider>().addMarker(
            userModel["id"],
            userModel["name"],
            userModel["latitude"],
            userModel["longitude"],
          );
    }
  }

  static void addMarkForOneStudent(BuildContext context, Map student) {
    context.read<LocationProvider>().addMarker(
          student["id"],
          student["name"],
          student["latitude"],
          student["longitude"],
        );
  }
}
