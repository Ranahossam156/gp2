import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final controller = MapController(
      //   trackUserLocation: const UserTrackingOption(
      // enableTracking: true,
      // unFollowUser: false,
      );
  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: controller,
      osmOption: OSMOption(
        userTrackingOption: const UserTrackingOption(
          enableTracking: true,
          unFollowUser: false,
        ),
        zoomOption: const ZoomOption(
          initZoom: 8,
          minZoomLevel: 3,
          maxZoomLevel: 19,
          stepZoom: 1.0,
        ),
        userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.location_history_rounded,
              color: Color(0xff076092),
              size: 48,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
        roadConfiguration: const RoadOption(
          roadColor: Colors.blueGrey,
        ),

        // markerOption: MarkerOption(
        //     defaultMarker: MarkerIcon(
        //         icon: Icon(
        //           Icons.person_pin_circle,
        //           color: Colors.blue,
        //           size: 56,
        //         ),
        //     )
        // ),
      ),
      // onMapIsReady: (isReady) async {
      //   if (isReady) {
      //     await Future.delayed(Duration(seconds: 1), () async {
      //       await controller.currentLocation();
      //     });
      //   }
      // },
    );
  }
}//mapIsLoading: const Center(child: CircularProgressIndicator(),),
