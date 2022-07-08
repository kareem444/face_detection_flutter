import 'dart:async';
import 'package:face_recongantion/v2/service/session_service.dart';
import 'package:face_recongantion/v2/controller/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:face_recongantion/v2/service/bottom_sheet_service.dart';
import 'package:face_recongantion/v2/view/widgets/create_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LectureLocationPage extends StatefulWidget {
  const LectureLocationPage({Key? key, required this.sessionId})
      : super(key: key);

  final String sessionId;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 6,
  );

  @override
  State<LectureLocationPage> createState() => _LectureLocationPageState();
}

class _LectureLocationPageState extends State<LectureLocationPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    SessionService.streamOnSession(context, widget.sessionId);
  }

  @override
  Widget build(BuildContext context) {
    return CreatePageWidget(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            BottomSheetService.viewStudents(context, widget.sessionId),
        label: const Text(
          'View Students',
          style: TextStyle(fontSize: 18),
        ),
        icon: const Icon(Icons.people_alt_rounded),
      ),
      page: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: LectureLocationPage._kGooglePlex,
        zoomControlsEnabled: false,
        markers: context.watch<LocationProvider>().studentsMarkers,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
