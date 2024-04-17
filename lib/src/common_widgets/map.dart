import 'package:flutter/material.dart';
import 'package:gp2/src/common_widgets/bottom_sheet_widget.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class Map5 extends StatefulWidget {
  final Function(String) onAddressPicked;
  const Map5({Key? key, required this.onAddressPicked}) : super(key: key);

  @override
  State<Map5> createState() => _Map4State();
}

class _Map4State extends State<Map5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Your App', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff076092),
        actions: <Widget>[
          //IconButton
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.person),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ],
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ),
        body: FlutterLocationPicker(
            zoomButtonsColor: const Color(0xff076092),
            locationButtonsColor: const Color(0xff076092),
            zoomButtonsBackgroundColor: Colors.white,
            locationButtonBackgroundColor: Colors.white,
            initPosition: const LatLong(23, 89),
            showCurrentLocationPointer: true,
            searchbarInputBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color(0xff076092)), // Set the border color here
              borderRadius: BorderRadius.circular(5),
            ),
            searchbarInputFocusBorderp: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color(0xff076092)), // Set the border color here
              borderRadius: BorderRadius.circular(5),
            ),
            markerIcon: const Icon(
              Icons.location_pin,
              color: Color(0xff076092),
            ),
            selectLocationButtonStyle: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff076092)),
            ),
            selectedLocationButtonTextstyle:
                const TextStyle(fontSize: 18, color: Colors.white),
            selectLocationButtonText: 'Start Forcasting',
            initZoom: 11,
            minZoomLevel: 5,
            maxZoomLevel: 16,
            loadingWidget: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff076092)), // Set the color here
            ),
            trackMyPosition: true,
            onError: (e) => print(e),
            onPicked: (pickedData) {
              widget.onAddressPicked(pickedData.address);
              Navigator.pop(context);
              print(pickedData.latLong.latitude);
              print(pickedData.latLong.longitude);
              print(pickedData.address);
              print(pickedData.addressData['country']);
            },
            onChanged: (pickedData) {
              print(pickedData.latLong.latitude);
              print(pickedData.latLong.longitude);
              print(pickedData.address);
              print(pickedData.addressData);
            }));
  }
}
