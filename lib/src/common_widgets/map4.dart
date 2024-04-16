import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
class Map4 extends StatefulWidget {
  final Function(String) onAddressPicked;
  const Map4({Key? key,required this.onAddressPicked}) : super(key: key);

  @override
  State<Map4> createState() => _Map4State();
}

class _Map4State extends State<Map4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLocationPicker(
          initPosition: LatLong(23, 89),
          selectLocationButtonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff076092)),
          ),
          selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
          selectLocationButtonText: 'Set Current Location',
          selectLocationButtonLeadingIcon: const Icon(Icons.check),
          initZoom: 11,
          minZoomLevel: 5,
          maxZoomLevel: 16,
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
          })
    );
  }
}
