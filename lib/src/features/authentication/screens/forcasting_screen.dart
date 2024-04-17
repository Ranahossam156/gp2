import 'package:flutter/material.dart';
import 'package:gp2/src/common_widgets/bottom_sheet_widget.dart';
import 'package:gp2/src/common_widgets/map.dart';
import 'package:gp2/src/common_widgets/map3.dart';
import 'package:gp2/src/common_widgets/map4.dart';
import 'package:gp2/src/common_widgets/map_widget.dart';

class ForecastingScreen extends StatefulWidget {
  const ForecastingScreen({Key? key}) : super(key: key);

  @override
  State<ForecastingScreen> createState() => _ForecastingScreenState();
}

class _ForecastingScreenState extends State<ForecastingScreen> {
  String _pickedLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff076092),
        actions: <Widget>[
          //IconButton
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.settings),
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
      body: Map4(
        onAddressPicked: (address) {
          // Handle the picked address here if needed
        },
      ), //Column(
      //   children: [
      //     Text(_pickedLocation), // Display picked location here
      //     ElevatedButton(
      //       onPressed: () async {
      //         await _openMapPage(context); // Wait for location picking
      //         showModalBottomSheet(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return BottomSheetWidget(); // Return the BottomSheetWidget here
      //           },
      //         );
      //       },
      //       child: const Text('Select Location and Forecast'),
      //     ),
      //   ],
      // ),
    );
  }

  Future<void> _openMapPage(BuildContext context) async {
    final pickedAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Map4(
          onAddressPicked: (address) {
            setState(() {
              _pickedLocation = address;
            });
          },
        ),
      ),
    );

    // Handle the picked address returned from Map3
    if (pickedAddress != null) {
      setState(() {
        _pickedLocation = pickedAddress;
      });
    }
  }
}
