import 'package:flutter/material.dart';
import 'package:gp2/src/common_widgets/bottom_sheet_widget.dart';
import 'package:gp2/src/common_widgets/map.dart';
import 'package:gp2/src/common_widgets/map3.dart';
import 'package:gp2/src/common_widgets/map_widget.dart';

class ForecastingScreen extends StatelessWidget {
  const ForecastingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your App'),
        ),
        body:  Column(
          children: [
            Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetWidget(); // Return the BottomSheetWidget here
                  },
                );
              },
              child: Text('Open Bottom Sheet'),
            ),
            ),
          ],
        ),
        );
  }
}
