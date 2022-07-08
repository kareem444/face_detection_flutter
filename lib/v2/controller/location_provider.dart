import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier {
  Set<Marker> studentsMarkers = {};

  bool isMarkAllStudents = false;

  List markedStudents = [];

  addMarker(String markId, String title, double lat, double long) {
    studentsMarkers.add(
      Marker(
        markerId: MarkerId(markId),
        infoWindow: InfoWindow(title: title),
        position: LatLng(
          lat,
          long,
        ),
      ),
    );
    markedStudents.add(markId);
    notifyListeners();
  }

  handelIsMarkAllStudent(bool val) {
    isMarkAllStudents = val;
    notifyListeners();
  }

  removeAllMarks() {
    studentsMarkers.clear();
    markedStudents.clear();
    handelIsMarkAllStudent(false);
    notifyListeners();
  }

  removeOneMark(String markId) {
    studentsMarkers.removeWhere((marker) => marker.markerId.value == markId);
    markedStudents.remove(markId);
    if (isMarkAllStudents) {
      handelIsMarkAllStudent(false);
    }
    notifyListeners();
  }
}
